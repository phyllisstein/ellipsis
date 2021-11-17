if ! hash gcloud &> /dev/null
    set -gx PATH /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin $PATH
end
