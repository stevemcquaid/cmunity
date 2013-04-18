# Load the rails application
require File.expand_path('../application', __FILE__)


Cmunity::Application.configure do
	config.action_mailer.perform_deliveries = true
	config.action_mailer.raise_delivery_errors = true
	config.action_mailer.smtp_settings = 
		{

		:address            => 'smtp.gmail.com',
		:port               => 587,
		:domain             => 'gmail.com',
		:authentication     => :plain,
		:user_name          => 'thecmunity@gmail.com',
		:password           => 'pzyfvbpfisdttyzo'
		:enable_starttls_auto => true
		}
end
# Initialize the rails application
Cmunity::Application.initialize!