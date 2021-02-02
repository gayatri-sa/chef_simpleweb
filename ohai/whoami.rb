
Ohai.plugin(:WhoAmI) do
  provides 'woami'
  # depends

  collect_data(:default) do
    Ohai::Log.debug('I am in custom ohai!')
    whoami 'I am me'
  end
end
