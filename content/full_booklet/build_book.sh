cd ..
for d in page*/; 
	do (cd "$d" && /Users/juaneduardoflores/.pyenv/shims/vpype read "${d%?}".svg layout 14cmx19cm write book_"${d%?}".svg && /Applications/Inkscape.app/Contents/MacOS/inkscape "./book_${d%?}.svg" --export-filename=../full_booklet/pdfs/${d%?}.pdf);
done

cd ./full_booklet/pdfs/
/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py -o ../plotnotes.pdf $(ls -rt)
