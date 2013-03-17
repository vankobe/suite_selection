Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '574729069205223', '34c5abf6b91780fdcddf666268d48bec'
end
