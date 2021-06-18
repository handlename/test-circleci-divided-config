local common = import 'common.libsonnet';

{
  version: '2.1',

  jobs: {
    run_bar: {
      docker: [
        {
          image: 'cimg/base:2021.05',
        },
      ],
      steps: [
        {
          run: {
            command: 'echo "this is bar!!"',
          },
        },
        common.say_hello,
      ],
    },
  },

  workflows: {
    version: 2,
    run_bar: {
      jobs: [
        'run_bar',
      ],
    },
  },
}
