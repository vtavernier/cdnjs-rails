module CDNJS
  module ViewHelpers
    def cdnjs_include_tag(cdn_vars=nil)
      cdn_vars       ||= Rails.application.config.cdnjs
      js_string_output = Array.new

      cdn_vars.each do |js_file_config|
        cdnjs_path = js_file_config.fetch(:cdnjs, nil)
        window_var = js_file_config.fetch(:windowvar, nil)
        local_path = js_file_config.fetch(:localpath, nil)

        # Output cdnjs loading tag
        js_string_output << javascript_include_tag("//cdnjs.cloudflare.com/ajax/libs/#{cdnjs_path}")

        # Only print fallback code if fallback parameters have been specified
        if window_var and local_path
          split_vars = window_var.split(".")
          window_path = ""

          split_vars.each_with_index do |val, index|
            var_check = ["window"]

            0.upto(index) do |i|
              var_check.push split_vars[i]
            end

            window_path << var_check.join(".") + " && "
          end

          window_path.chomp!(" && ")
          js_string_output << javascript_tag("(#{window_path}) || document.write(unescape(\"%3Cscript src='#{asset_path(local_path).gsub('<','%3C')}' type='text/javascript'%3E%3C/script%3E\"))")
        end
      end

      js_string_output.join("\n").html_safe
    end
  end
end

