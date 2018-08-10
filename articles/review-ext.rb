module ReVIEW
  module LATEXBuilderOverride
    def table_header(id, caption)
      # \begin{table}[h]の[h]を削除
      if id.nil?
        if caption.present?
          @table_caption = true
          #@doc_status[:caption] = true
          puts "\\begin{table}%%#{id}"
          puts macro('reviewtablecaption*', compile_inline(caption))
          #@doc_status[:caption] = nil
        end
      else
        if caption.present?
          @table_caption = true
          #@doc_status[:caption] = true
          puts "\\begin{table}%%#{id}"
          puts macro('reviewtablecaption', compile_inline(caption))
          #@doc_status[:caption] = nil
        end
        puts macro('label', table_label(id))
      end
    end
  end

  class LATEXBuilder
    prepend LATEXBuilderOverride
  end
end