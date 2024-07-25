for i in include/*.haml; do
    base=$(basename -s .haml "$i")
    haml "$i" | sed 's/_/ /g' > include/$base.html
done


for i in pages/*.haml; do
    base=$(basename -s .haml "$i")
    file="$base.html"
    #haml "$i" | sed 's/_/ /g' > $base.html
    head -1 "pages/$base.haml" > tmp.haml
    cat page.haml >> tmp.haml
    sed -i s/__FILE__/$file/ tmp.haml
    haml render tmp.haml --no-escape-html | sed 's/_/ /g' > $file

    rm -f tmp.haml
done


haml render index.haml --no-escape-html | sed 's/_/ /g' > index.html
