Puppet::Type.newtype(:runner) do

  desc 'runner manages the Gitlab-ci multi-runner'

  ensurable

  newparam(:name, :namevar => true) do
     desc 'The name of runner'
    isrequired
  end

  newparam(:url) do
    desc 'The name url of the gitlab server'
    isrequired
  end

  newparam(:tags, :array_matching => :all) do
    isrequired
  end

  newparam(:token) do
    desc 'The name gitlab registration token'
    isrequired
  end

  newparam(:cache_dir) do
    desc 'Directory where build cache is stored'
    isrequired
  end

  newparam(:builds_dir) do
    desc 'Directory where builds are stored'
    isrequired
  end

  newparam(:docker_image) do
  desc 'The docker image to use'
  end

  newparam(:network_mode) do
  desc 'Add container to a custom network'
  end

  newparam(:privileged) do
  desc 'Give extended privileges to container'
  newvalue(:true, :false)
  end

  newparam(:volumes) do
  desc 'Bind mount volumes'
    validate do |value|
      unless value =~ (\/.+:\/.+)/*
        raise ArgumentError, "%s is not a valid volume" % value
      end
    end
  end




  newparam(:executor) do
    isrequired
    validate do |value|
      if value == 'docker'
        fail Puppet::Error, "Docker executor needs docker_image parameter" unless !@resource[:docker_image].nil?
      end
    end
  end

end
