def call(Map config=[:]) {
  sh "echo Hello ${config.name}, Today is ${config.dayOfWeek}"
}


def anothercall() {
  sh "Hello from another function"
}
