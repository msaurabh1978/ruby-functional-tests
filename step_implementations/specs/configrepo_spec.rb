##########################################################################
# Copyright 2018 ThoughtWorks, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
##########################################################################

step 'Create a new config repo pipeline with name <pipeline> on repo <repo> as downstream of <upstream>' do |pipeline, repo, upstream|
  Context::ConfigRepoMaterial.new.setup(pipeline, repo.to_i, upstream)
end

step 'Create a new config repo environment with name <environment> on repo <repo>' do |environment, repo|
  Context::ConfigRepoEnvironment.new.setup(environment, repo.to_i)
end

step 'Create a partial config repo environment with name <environment> on repo <repo>' do |environment, repo|
  Context::ConfigRepoEnvironment.new.setup_existing(environment, repo.to_i)
end

step 'Wait for config repo changes to sync' do
  sleep 30
end

step 'Set config repo id as <config_repo_id>' do |config_repo_id|
  config_repos_page.set_config_repo_id(config_repo_id)
end

step 'Set config repo url as <url>' do |url|
  config_repos_page.set_url(url)
end

step 'Set config repo ssh_private_key as <key>' do |key|
  config_repos_page.set_ssh_private_key(key)
end

step 'Set config repo ssh_private_key while edit as <key>' do |key|
  config_repos_page.click_private_key_reset
  config_repos_page.set_ssh_private_key(key)
end

step 'Verify success flash message <message>' do |message|
  assert_true config_repos_page.get_flash_message.include? message
end

step 'Verify ssh private key <key> and passphrase <passphrase> are present on config repos page' do |key, passphrase|
  assert_true config_repos_page.get_view_only_ssh_private_key.include? key
  assert_true config_repos_page.get_view_only_ssh_passphrase.include? passphrase
end

step 'Set config repo ssh_passphrase as <passphrase>' do |passphrase|
  config_repos_page.set_passphrase(passphrase)
end

step 'Set config repo ssh_passphrase while edit as <passphrase>' do |key|
  config_repos_page.click_passphrase_reset
  config_repos_page.set_ssh_private_key(key)
end

step 'Go to config repos page' do
  config_repos_page.load
end

step 'Perform add config repo action' do
  config_repos_page.click_add
end

step 'Save config repo' do
  config_repos_page.save_config_repo
end

step 'Edit config repo <config_repo_id>' do |config_repo_id|
  config_repos_page.edit_config_repo(config_repo_id)
end

step 'Add pipelines <pipelines> to config repo environment <environment>' do |pipelines, environment|
  pipelines.split(',').each { |p| scenario_state.get("#{environment}-configrepo").add_pipeline(scenario_state.get(p.strip)) }
end

step 'Update config repo pipeline with name <pipeline> as downstream of <upstream>' do |pipeline, upstream|
  scenario_state.get("#{pipeline}-configrepo").update_pipeline(upstream)
end
