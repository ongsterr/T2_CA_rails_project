
# Complete this section with proper domain name once decided
OmniAuth.config.full_host = Rails.env.production? ? 'https://domain.com' : 'http://localhost:3000'
OmniAuth.config.logger = Rails.logger