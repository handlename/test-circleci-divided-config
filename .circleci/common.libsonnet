{
  job_pass: {
    docker: [
      {
        image: 'cimg/base:2021.05',
      },
    ],
    steps: [
      {
        run: {
          command: 'echo pass',
        },
      },
    ],
  },
  job_step_say_hello: {
    run: {
      command: 'echo "HELLO CIRCLECI!!"',
    },
  },
}
