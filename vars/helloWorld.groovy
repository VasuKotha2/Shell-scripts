def helloWorld(Map Config = [:]) {
  sh "echo Hello ${config.name} Today is ${config.dayOfWeek}"
}
