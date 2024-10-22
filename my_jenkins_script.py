import jenkins
import time

# Jenkins credentials
JENKINS_URL = 'http://98.84.170.64:8080'
USERNAME = 'admin'
PASSWORD = 'admin'

# Connect to Jenkins
server = jenkins.Jenkins(JENKINS_URL, username=USERNAME, password=PASSWORD)

# List of job names to create
jobs = ['job_1', 'job_2', 'job_3']

# XML config for Jenkins jobs (example basic configuration)
job_config = """
<project>
  <actions/>
  <description>Job created via python-jenkins</description>
  <keepDependencies>false</keepDependencies>
  <properties/>
  <scm class="hudson.scm.NullSCM"/>
  <canRoam>true</canRoam>
  <disabled>false</disabled>
  <blockBuildWhenDownstreamBuilding>false</blockBuildWhenDownstreamBuilding>
  <blockBuildWhenUpstreamBuilding>false</blockBuildWhenUpstreamBuilding>
  <triggers/>
  <concurrentBuild>false</concurrentBuild>
  <builders/>
  <publishers/>
  <buildWrappers/>
</project>
"""

# Create jobs
for job in jobs:
    if not server.job_exists(job):
        server.create_job(job, job_config)
        print(f"Job '{job}' created")

# Trigger jobs to run in parallel
build_ids = []
for job in jobs:
    build_number = server.build_job(job)
    build_ids.append((job, build_number))
    print(f"Triggered build for job '{job}'")

# Optionally wait for all jobs to finish
for job, build_number in build_ids:
    while True:
        build_info = server.get_build_info(job, build_number)
        if build_info['building']:
            print(f"Job '{job}' is still running...")
            time.sleep(5)  # Wait for a while before checking again
        else:
            print(f"Job '{job}' completed with status: {build_info['result']}")
            break
