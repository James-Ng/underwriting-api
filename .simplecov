SimpleCov.coverage_dir('tmp/coverage')

# save to CircleCI's artifacts directory if we're on CircleCI
# see https://circleci.com/docs/code-coverage
if ENV['CIRCLE_ARTIFACTS']
  dir = File.join(ENV['CIRCLE_ARTIFACTS'], 'coverage')
  SimpleCov.coverage_dir(dir)
end


SimpleCov.start 'rails'