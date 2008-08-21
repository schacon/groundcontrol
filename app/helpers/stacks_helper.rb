module StacksHelper
  def display_hosts(stack)
    # KLUDGE: using the +link_to+ method here to generate the hyperlink breaks rspec tests
    stack.hosts.collect{ |h| "<a href=\"#{host_path(h)}\">#{h.hostname}</a>" }.join(", ")
  end
end
