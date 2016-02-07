

def get_pages(text_dir)
  # file entries
  pages = Dir::entries(text_dir)
  
  # ignore directories
  pages.reject! {|file| File::ftype("#{text_dir}/#{file}") == "directory"}
  
  # ignore patterns
  [/^_partial\..+?$/].each {|pattern|
    pages.reject! { |file| file =~ pattern }
  }
  
  # remove file extention
  pages.map! {|page| File.basename(page, ".md")}
  
  return pages
end



p get_pages("text")