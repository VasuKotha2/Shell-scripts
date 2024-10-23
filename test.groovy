def runPythonScript(scriptPath) {
    def command = "python3 ${scriptPath}"
    def process = command.execute() // Execute the command

    // Capture the output and error stream
    def output = process.text // Get all output
    def exitCode = process.waitFor() // Wait for the process to finish

    println "Exit Code: $exitCode"
    println "Output:\n$output"
}

// Specify the path to your Python script
def pythonScriptPath = "hello.py"

// Run the Python script
runPythonScript(pythonScriptPath)