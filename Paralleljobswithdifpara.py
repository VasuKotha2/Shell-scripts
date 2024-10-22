import jenkins
import threading
import time

# Jenkins connection details
JENKINS_URL = 'http://your-jenkins-url'
USERNAME = 'your-username'
PASSWORD = 'your-password'

# Connect to Jenkins
server = jenkins.Jenkins(JENKINS_URL, username=USERNAME, password=PASSWORD)

# Function to trigger a Jenkins job with parameters
def trigger_job(job_name, params):
    print(f"Triggering job: {job_name} with parameters: {params}")
    try:
        # Trigger the job with parameters
        build_number = server.build_job(job_name, parameters=params)
        print(f"Build number {build_number} started for job {job_name}")
        
        # Poll until the job finishes
        while server.get_job_info(job_name)['lastCompletedBuild']['number'] < build_number:
            print(f"Waiting for job {job_name} to complete...")
            time.sleep(5)

        print(f"Job {job_name} completed successfully!")

    except jenkins.JenkinsException as e:
        print(f"Failed to trigger job {job_name}: {str(e)}")

# Function to get user input for jobs and parameters
def get_jobs_from_user():
    jobs_with_params = []
    num_jobs = int(input("Enter the number of jobs to trigger: "))

    for i in range(num_jobs):
        job_name = input(f"Enter the name of job {i + 1}: ")
        num_params = int(input(f"Enter the number of parameters for {job_name}: "))

        params = {}
        for j in range(num_params):
            param_key = input(f"Enter the key for parameter {j + 1}: ")
            param_value = input(f"Enter the value for parameter {j + 1}: ")
            params[param_key] = param_value

        jobs_with_params.append({'job_name': job_name, 'params': params})

    return jobs_with_params

# Get jobs and their parameters from the user
jobs_with_params = get_jobs_from_user()

# Create threads for each job with its parameters
threads = []
for job in jobs_with_params:
    t = threading.Thread(target=trigger_job, args=(job['job_name'], job['params']))
    threads.append(t)

# Start all threads (jobs)
for t in threads:
    t.start()

# Wait for all threads to finish
for t in threads:
    t.join()

print("All jobs triggered and completed.")
