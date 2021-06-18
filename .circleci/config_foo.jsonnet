local common = import 'common.libsonnet';

{
  version: '2.1',

  jobs: {
    run_foo: {
      docker: [
        {
          image: 'cimg/base:2021.05',
        },
      ],
      steps: [
        {
          run: {
            command: 'echo "this is foo!!"',
          },
        },
        common.say_hello,
      ],
    },
  },

  workflows: {
    version: 2,
    run_foo: {
      jobs: [
        'run_foo',
      ],
    },
  },
}
