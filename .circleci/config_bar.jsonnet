local common = import 'common.libsonnet';

{
  version: '2.1',

  parameters: {
    run_bar: {
      type: 'boolean',
      default: false,
    },
  },

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
        common.job_step_say_hello,
      ],
    },
    pass: common.job_pass,
  },

  workflows: {
    version: 2,
    run_bar: {
      jobs: [
        'run_bar',
      ],
    },
    pass: {
      when: '<< pipeline.parameters.run_bar >>',
      jobs: [
        'pass',
      ],
    },
  },
}
