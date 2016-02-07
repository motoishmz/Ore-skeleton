require 'bundler'
Bundler.require

# set :root => "../"

Text_Directory = "text"

def get_page_title(text_file_path)
  title = ""
  File.open(text_file_path){|file|
    title = file.gets
        .sub("\n", "") # linebreak
        .sub(/^#+? /, "") # markdown symbol of heading
  }
  return title
end

def get_pages(text_dir_path)
  # file entries
  pages = Dir::entries(text_dir_path)
  
  # ignore directories
  pages.reject! {|page| File::ftype("#{text_dir_path}/#{page}") == "directory"}
  
  # ignore patterns
  [/^_partial\..+?$/].each {|pattern|
    pages.reject! { |page| page =~ pattern}
  }
  
  # first lines as readable page title
  titles = pages.map {|page| get_page_title("#{text_dir_path}/#{page}")}
  
  # remove file extention from filename
  pages.map! {|page| File.basename(page, ".md")}
  
  return pages, titles
end

before do
  @pages, @titles = get_pages(Text_Directory)
end


# routing!
get '/' do
  erb :index, :locals => { 
    :tagline => markdown(:"../#{Text_Directory}/_partial.tagline"),
    :introduction => markdown(:"../#{Text_Directory}/_partial.introduction")
  }
end
get '/:name' do
  erb :page, :locals => {
    :text => markdown(:"../#{Text_Directory}/#{params[:name]}"),
    :title => params[:name] 
  }
end
