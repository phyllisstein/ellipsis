if ! hash gcloud &> /dev/null
    set -x PATH /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin $PATH
end
