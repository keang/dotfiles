export warnflags=-Wno-error=implicit-function-declaration
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

alias prodauth="jora aws-auth -p prod -r ADFS-Jora-JobStream-Prod-Admin && export AWS_PROFILE=prod"
alias devauth="jora aws-auth -p dev -r ADFS-Jora-JobStream-dev-Admin && export AWS_PROFILE=dev"
alias oldauth="jora aws-auth -p default -r ADFS-Jora-Developer && export AWS_PROFILE=default"

alias oktaauth="~/w/aws-auth-bash/auth.sh --user keang.song@jora.com --auth-only --mfa 2"

alias devotter="export AWS_PROFILE=OtterDev"
alias prodotter="export AWS_PROFILE=OtterProd"
alias prodadmin="~/w/aws-auth-bash/auth.sh -d -p OtterProd -a 'Amazon Web Services (Unified)' && export AWS_PROFILE=OtterProd"
alias devotterauth="~/w/aws-auth-bash/auth.sh -d -p OtterDev -a 'Amazon Web Services (Unified)' && export AWS_PROFILE=OtterDev"
