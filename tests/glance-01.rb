require "test_utils"

describe "glance-01" do
  extend LogStash::RSpec
  config <<-CONFIG
filter {
        grok {
            match => { "message" => "%{GREEDYDATA:foo}" }
            patterns_dir => "/root/logstash-openstack/patterns"
        }
}
CONFIG
  sample({'@message' => '2014-07-14 17:35:55 32402 DEBUG glance.api.middleware.version_negotiation [-] Determining version of request: HEAD /v1/images/eafe88bb-1c80-46cd-a590-55214f9479d2 Accept:  process_request /usr/lib/python2.7/dist-packages/glance/api/middleware/version_negotiation.py:46',}) do
    puts subject["tags"]
    puts subject["foo"]
    insist { subject }
  end
end
