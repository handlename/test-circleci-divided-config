local common = import 'common.libsonnet';

{
  version: '2.1',

  parameters: {
    run_foo: {
      type: 'boolean',
      default: false,
    },
  },

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
        common.job_step_say_hello,
      ],
    },
    pass: common.job_pass,
  },

  workflows: {
    version: 2,
    run_foo: {
      jobs: [
        'run_foo',
      ],
    },
    pass: {
      when: '<< pipeline.parameters.run_foo >>',
      jobs: [
        'pass',
      ],
    },
  },
}
