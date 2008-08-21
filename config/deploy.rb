
set :runner, "mike"

# =============================================================================
# CUSTOM OPTIONS
# =============================================================================
set :user, "mike"

set :application, "hunterartsnetwork.org"
set :domain, "67.207.145.42"
set :alias, %{ hunterartsnetwork.org }

role :web, domain
role :app, domain
role :db,  domain, :primary => true

# =============================================================================
# DATABASE OPTIONS
# =============================================================================
# set :rake, :nil
set :rails_env,       "production"
# set :migrate_env,     "development"
# set :migrate_target,  :latest

# =============================================================================
# DEPLOY TO
# =============================================================================
set :deploy_to, "/home/#{user}/#{application}"

# =============================================================================
# REPOSITORYy
# =============================================================================
set :scm, "git"
set :deploy_via, :remote_cache 
set :repository, "/home/#{user}/hunterartsnetwork.git"

# =============================================================================
# SSH OPTIONS
# =============================================================================

default_run_options[:pty] = true
ssh_options[:paranoid] = false
ssh_options[:keys] = %w(/Users/mike/.ssh/id_rsa)
ssh_options[:port] = 1600

