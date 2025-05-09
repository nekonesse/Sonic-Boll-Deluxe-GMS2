alpha=0
go=0
curpage=0
depth=1

x=floor((400-(sprite_width-78))/2)
y=floor((224-sprite_height)/2)

var k,c,v,map;

map=global.statmap
                   
maxpage=0                  
str[maxpage]=""
str2[maxpage]=""
c[maxpage]=0
k=ds_map_find_first(map)
repeat (ds_map_size(map)) {
    v=ds_map_find_value(map,k)
    if (c[maxpage]>51) {
        maxpage+=1
        str[maxpage]=""
        str2[maxpage]=""
        c[maxpage]=0
    }
    if (c[maxpage]>25) {
        if (is_string(v)) str2[maxpage]+=string(k)+": "+qt+v+qt+lf
        else str2[maxpage]+=string(k)+": "+string(v)+lf
    } else {
        if (is_string(v)) str[maxpage]+=string(k)+": "+qt+v+qt+lf
        else str[maxpage]+=string(k)+": "+string(v)+lf
    }
    c[maxpage]+=1
    k=ds_map_find_next(map,k)
}