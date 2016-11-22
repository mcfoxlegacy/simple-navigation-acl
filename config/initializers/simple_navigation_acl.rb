


SimpleNavigationAcl::Base.contexts += %w(admin mini)
SimpleNavigationAcl::Base.current_user_method = :current_user
SimpleNavigationAcl::Base.verify_method = :role?