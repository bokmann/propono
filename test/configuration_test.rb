require File.expand_path('../test_helper', __FILE__)

module Propono
  class ConfigurationTest < Minitest::Test

    def setup
      super
      Propono.instance_variable_set("@config", nil)
    end

    def test_obtaining_singletion
      refute Propono.config.nil?
    end

    def test_block_syntax
      test_key = "foobar-123-access"
      Propono.config do |config|
        config.access_key = test_key
      end
      assert_equal test_key, Propono.config.access_key
    end

    def test_use_iam_profile_defaults_false
      assert ! Propono.config.use_iam_profile
    end

    def test_use_iam_profile
      Propono.config.use_iam_profile = true
      assert Propono.config.use_iam_profile
    end

    def test_access_key
      access_key = "test-access-key"
      Propono.config.access_key = access_key
      assert_equal access_key, Propono.config.access_key
    end

    def test_secret_key
      secret_key = "test-secret-key"
      Propono.config.secret_key = secret_key
      assert_equal secret_key, Propono.config.secret_key
    end

    def test_queue_region
      queue_region = "test-queue-region"
      Propono.config.queue_region = queue_region
      assert_equal queue_region, Propono.config.queue_region
    end

    def test_application_name
      application_name = "test-application-name"
      Propono.config.application_name = application_name
      assert_equal application_name, Propono.config.application_name
    end

    def test_queue_suffix
      queue_suffix = "test-application-name"
      Propono.config.queue_suffix = queue_suffix
      assert_equal queue_suffix, Propono.config.queue_suffix
    end

    def test_udp_host
      val = "test-application-name"
      Propono.config.udp_host = val
      assert_equal val, Propono.config.udp_host
    end

    def test_udp_port
      val = 10000
      Propono.config.udp_port = val
      assert_equal val, Propono.config.udp_port
    end

    def test_tcp_host
      val = "test-application-name"
      Propono.config.tcp_host = val
      assert_equal val, Propono.config.tcp_host
    end

    def test_tcp_port
      val = 9382
      Propono.config.tcp_port = val
      assert_equal val, Propono.config.tcp_port
    end

    def test_num_messages_per_poll
      val = 3
      Propono.config.num_messages_per_poll = val
      assert_equal val, Propono.config.num_messages_per_poll
    end

    def test_missing_access_key_throws_exception
      assert_raises(ProponoConfigurationError) do
        Propono.config.access_key
      end
    end

    def test_missing_secret_key_throws_exception
      assert_raises(ProponoConfigurationError) do
        Propono.config.secret_key
      end
    end

    def test_missing_queue_region_throws_exception
      assert_raises(ProponoConfigurationError) do
        Propono.config.queue_region
      end
    end

    def test_missing_application_name_throws_exception
      assert_raises(ProponoConfigurationError) do
        Propono.config.application_name
      end
    end

    def test_default_max_retries
      assert_equal 0, Propono.config.max_retries
    end

    def test_max_retries
      val = 5
      Propono.config.max_retries = val
      assert_equal 5, Propono.config.max_retries
    end
  end
end

