(window.webpackJsonp=window.webpackJsonp||[]).push([[2],{567:function(t,e,i){var c=i(568);"string"==typeof c&&(c=[[t.i,c,""]]),c.locals&&(t.exports=c.locals);(0,i(4).default)("cc6cdea4",c,!0,{})},568:function(t,e,i){(t.exports=i(3)(!1)).push([t.i,".sticker-picker{width:100%;position:relative}.sticker-picker .tab-switcher{position:absolute;top:0;bottom:0;left:0;right:0}.sticker-picker .sticker-picker-content .sticker{display:inline-block;width:20%;height:20%}.sticker-picker .sticker-picker-content .sticker img{width:100%}.sticker-picker .sticker-picker-content .sticker img:hover{filter:drop-shadow(0 0 5px var(--link,#d8a070))}",""])},569:function(t,e,i){"use strict";i.r(e);var c=i(88),a={components:{TabSwitcher:i(49).a},data:function(){return{meta:{stickers:[]},path:""}},computed:{pack:function(){return this.$store.state.instance.stickers||[]}},methods:{clear:function(){this.meta={stickers:[]}},pick:function(t,e){var i=this,a=this.$store;fetch(t).then(function(t){t.blob().then(function(t){var n=new File([t],e,{mimetype:"image/png"}),r=new FormData;r.append("file",n),c.a.uploadMedia({store:a,formData:r}).then(function(t){i.$emit("uploaded",t),i.clear()},function(t){console.warn("Can't attach sticker"),console.warn(t),i.$emit("upload-failed","default")})})})}}},n=i(0);var r=function(t){i(567)},s=Object(n.a)(a,function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"sticker-picker"},[i("tab-switcher",{staticClass:"tab-switcher",attrs:{"render-only-focused":!0,"scrollable-tabs":""}},t._l(t.pack,function(e){return i("div",{key:e.path,staticClass:"sticker-picker-content",attrs:{"image-tooltip":e.meta.title,image:e.path+e.meta.tabIcon}},t._l(e.meta.stickers,function(c){return i("div",{key:c,staticClass:"sticker",on:{click:function(i){i.stopPropagation(),i.preventDefault(),t.pick(e.path+c,e.meta.title)}}},[i("img",{attrs:{src:e.path+c}})])}),0)}),0)],1)},[],!1,r,null,null);e.default=s.exports}}]);
//# sourceMappingURL=2.9f2ac5e61b4f3efacd6b.js.map