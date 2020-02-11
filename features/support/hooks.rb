require 'report_builder'
After do |scenario|
 
    scenarioName = scenario.name.gsub('/\s+','_').tr('/','_')
    
    if scenario.failed?
      takeScrshot(scenarioName.downcase!,'failed')
    else
      takeScrshot(scenarioName.downcase!,'passed')
    end  
    
   ReportBuilder.input_path = "cucumber.json" 
   ReportBuilder.configure do |config|
         config.report_path = "reports"
         config.report_types = [:json, :html] 
         ReportBuilder.build_report 
     end
end



