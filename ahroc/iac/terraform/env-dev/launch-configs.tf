resource "aws_launch_configuration" "jenkins-launchconfig" {
  name_prefix     = "jenkins-launchconfig"
  image_id        = data.aws_ami.jenkins-image.id
  instance_type   = "t2.large"
  key_name        = aws_key_pair.ahroc-key.key_name
  security_groups = [aws_security_group.jenkins-sg.id]
  user_data       = <<-EOF
	#!/bin/bash -v

	function waitForJenkins() {
	    echo "Waiting jenkins to launch on 8080..."
	    while ! nc -z localhost 8080; do
	      sleep 0.1 # wait for 1/10 of the second before check again
	    done
	    echo "Jenkins launched"
	}

	function waitForPasswordFile() {
	    echo "Waiting jenkins to generate password..."
	    while [ ! -f /var/lib/jenkins/secrets/initialAdminPassword ]; do
	      sleep 2 # wait for 1/10 of the second before check again
	    done
	    echo "Password created"
	}

	sudo service jenkins start
	sudo chkconfig --add jenkins

	waitForJenkins

	echo "Update plugin list."
	curl  -L http://updates.jenkins-ci.org/update-center.json | sed '1d;$d' | curl -X POST -H 'Accept: application/json' -d @- http://localhost:8080/updateCenter/byId/default/postBack

	sleep 10

	waitForJenkins

	echo "Install CLI."
	sudo cp /var/cache/jenkins/war/WEB-INF/jenkins-cli.jar /var/lib/jenkins/jenkins-cli.jar

	waitForPasswordFile

	PASS=$(sudo bash -c "cat /var/lib/jenkins/secrets/initialAdminPassword")

	echo "Admin password = $PASS"
	sleep 10

	echo "Set agent port"

	xmlstarlet ed -u "//slaveAgentPort" -v "${var.JNLP_PORT}" /var/lib/jenkins/config.xml > /tmp/jenkins_config.xml
	sudo mv /tmp/jenkins_config.xml /var/lib/jenkins/config.xml
	sudo service jenkins restart

	waitForJenkins

	sleep 10

	echo "Install plugins"

	sudo java -jar /var/lib/jenkins/jenkins-cli.jar -s http://localhost:8080 -auth admin:$PASS install-plugin "git"
	sudo java -jar /var/lib/jenkins/jenkins-cli.jar -s http://localhost:8080 -auth admin:$PASS install-plugin "xunit"

	echo "Restart Jenkins to activate plugins"
	sudo java -jar /var/lib/jenkins/jenkins-cli.jar -s http://localhost:8080 -auth admin:$PASS restart

	echo "Move groovy script to JENKINS_HOME/init.groovy.d to disable sign on screen"

	sudo mkdir /var/lib/jenkins/init.groovy.d
	sudo mv /tmp/init.groovy.d/basic-security.groovy /var/lib/jenkins/init.groovy.d

	echo "Restart Jenkins to activate new users"
	sudo service jenkins stop
	sudo service jenkins start

	waitForJenkins
	waitForPasswordFile

	sleep 60

	echo "Create admin user"

	pass=`sudo cat /var/lib/jenkins/secrets/initialAdminPassword` && echo 'jenkins.model.Jenkins.instance.securityRealm.createAccount("wdrew", "${var.JENKINS_PASSWORD}")' | sudo java -jar /var/lib/jenkins/jenkins-cli.jar -auth admin:$pass -s http://localhost:8080/ groovy =

EOF

}
