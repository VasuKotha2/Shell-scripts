def call(Map config=[:]) {
  sh "echo Hello ${config.name}, Today is ${config.dayOfWeek}"
}


def anothercall() {
  sh "echo Hello from another function"
}
