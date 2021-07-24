Rails.application.routes.draw do
	get '/campaigns/ordered_campaigns' => 'campaigns#ordered_campaigns', defaults: { format: 'json' }
end
