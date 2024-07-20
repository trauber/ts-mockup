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
    haml tmp.haml | sed 's/_/ /g' | gpp > $file
    rm -f tmp.haml
done

haml index.haml | sed 's/_/ /g' | gpp > index.html
