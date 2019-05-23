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

module Pages
  class ConfigReposPage < AppBase
    set_url "#{GoConstants::GO_SERVER_BASE_URL}/admin/config_repos"

    element :config_repo_modal, 'div[data-test-id="modal-body"]'
    element :search_box, '[data-test-id="search-box"]'

    load_validation { has_search_box? }

    def click_add
      page.find('button', text: 'Add').click
    end

    def save_config_repo
      find('button[data-test-id="button-ok"]').click
    end

    def set_url(value)
      find('[data-test-id="form-field-input-url"]').set(value)
    end

    def set_ssh_private_key(value)
      find('[data-test-id="form-field-input-ssh-private-key"]').set(value)
    end

    def get_ssh_private_key_parent
      return find('[data-test-id="form-field-input-ssh-private-key"]').ancestor("li")
    end

    def get_ssh_passphrase_parent
      return find('[data-test-id="form-field-input-ssh-passphrase"]').ancestor("li")
    end
    
    def get_flash_message
      return find('div[data-test-id="flash-message-success"]').text
    end

    def get_view_only_ssh_private_key
      return find('[data-test-id="key-value-value-ssh-private-key"]').text
    end

    def get_view_only_ssh_passphrase
      return find('[data-test-id="key-value-value-ssh-passphrase"]').text
    end

    def set_passphrase(value)
      find('[data-test-id="form-field-input-ssh-passphrase"]').set(value)
    end

    def click_private_key_reset
      ssh_private_key_parent = get_ssh_private_key_parent()
      if(ssh_private_key_parent)
        ssh_private_key_parent.find('button', text: 'Change').click
      end
    end

    def click_passphrase_reset
      ssh_passphrase_parent = get_ssh_passphrase_parent()
      if(ssh_passphrase_parent)
        ssh_passphrase_parent.find('button', text: 'Reset').click
      end
    end

    def set_config_repo_id (value)
      find('[data-test-id="form-field-input-config-repository-id"]').set(value)
    end

    def edit_config_repo(id)
      selected_header = find_collapsable_header(id)

      if (selected_header)
        selected_header.find("button[data-test-id='config-repo-edit']").click
      end
    end

    def find_collapsable_header(id)
      selected_header = page.all("div[data-test-id='collapse-header']")
                            .find {|widget| widget.find("h4").text === id}
    end
  end
end
