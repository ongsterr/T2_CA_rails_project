
# Complete this section with proper domain name once decided
OmniAuth.config.full_host = Rails.env.production? ? 'https://desolate-plateau-51220.herokuapp.com' || 'http://desolate-plateau-51220.herokuapp.com' : 'http://localhost:3000'
OmniAuth.config.logger = Rails.logger