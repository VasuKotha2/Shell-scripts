def helloWorld(Map config=[:]) {
  sh "echo Hello ${config.name}, Today is ${config.dayOfWeek}"
}
