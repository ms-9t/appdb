//
//  AdBlocker.swift
//  appdb
//
//  Created by ned on 11/05/2019.
//  Copyright © 2019 ned. All rights reserved.
//

import Foundation

struct AdBlocker {
    fileprivate init() { }
    static let shared = AdBlocker()
    
    func shouldBlock(host: String) -> Bool {
        return ads.contains(host)
    }
}

// iOS >= 11 only: load ads list and a few additions to block annoying ads/popups
let blockRules = """
    [
        {
            "trigger": {
                "url-filter": ".*",
                "if-domain": ["userscloud.com"]
            }, "action": {
                "type": "css-display-none",
                "selector": "#glx-10345-container"
            }
        },
        {
            "trigger": {
                "url-filter": ".*",
                "if-domain": ["filescdn.net"]
            }, "action": {
                "type": "css-display-none",
                "selector": "#glx-10348-container, iframe"
            }
        },
        {
            "trigger": {
                "url-filter": ".*",
                "if-domain": ["tusfiles.com"]
            }, "action": {
                "type": "css-display-none",
                "selector": "#glx-10349-container, iframe"
            }
        },
        {
            "trigger": {
                "url-filter": "https://dailyuploads.net/images_mega/logo.png",
                "if-domain": ["dailyuploads.net"]
            }, "action": {
                "type": "block"
            }
        },
        {
            "trigger": {
                "url-filter": ".*",
                "if-domain": \(ads.description)
            }, "action": {
                "type": "block"
            }
        }
    ]
"""

let ads: Set = [
    "tavertotsand.info",
    "xml.popunder.bid",
    "static-e-2-at-wqps7yvkz.stackpathdns.com",
    "djtflbt20bdde.cloudfront.net",
    "mybestmv.com",
    "syndication.exosrv.com",
    "bristlyapace.com",
    "dolohen.com",
    "getalinkandshare.com",
    "leadzuaf.com",
    "trafftraff.com",
    "chnghl.space",
    "rotatemyurls.com",
    "inspxtrc.com",
    "singles50.it",
    "href.li",
    "etreflased.info",
    "vexacion.com",
    "tdsmob.com",
    "mobi-security.com",
    "dspmulti.com",
    "stackpathdns.com",
    "realtime-bid.com",
    "invol.co",
    "arebronthenrollet.info",
    "deloplen.com",
    "inter1ads.com",
    "www.bet365.com",
    "eu.dspmulti.com",
    "bonus365.site",
    "xilbalar.com",
    "ads.planetwin365affiliate.com",
    "www.planetwin365.it",
    "m.planetwin365.it",
    "c.trfilter.info",
    "clickssp.pro",
    "yourprivacy.icu",
    "trglntds.com",
    "comeunadonna.blog",
    "runtnc.net",
    "clicktrkservices.com",
    "todaystechnologyprizes.icu",
    "click2partner.com",
    "cellarpiston.com",
    "bigxpanda.com",
    "fieryx.com",
    "design-builder.io",
    "appsthebest.com",
    "activemobile.com",
    "directrev.com",
    "addthis.com",
    "ade1rtb.com",
    "adk2x.com",
    "adrunnr.com",
    "appia.com",
    "openx.net",
    "staticxx.facebook.com",
    "ads.gold",
    "affapps.xyz",
    "affilanity.com",
    "appsflyer.com",
    "birdmobster.info",
    "patsup.com",
    "buzzie.tv",
    "aliexpress.com",
    "taptica.com",
    "clkrev.com",
    "kochava.com",
    "andoidtraffic.ru",
    "daily-chance.info",
    "humanwebr.com",
    "digitalworldads.com",
    "witchcraftcash.com",
    "doubleclick.net",
    "e10outads.com",
    "eclkmpsa.com",
    "4dsply.com",
    "entbreaka.bid",
    "gift-today5.online",
    "com-dailyreward.online",
    "instanceyou.info",
    "jikyik.com",
    "justgetitfaster.com",
    "khingtracking.com",
    "king.com",
    "leadpaid.com",
    "love4single.com",
    "starvegas.it",
    "market://",
    "mature2date.com",
    "measurementapi.com",
    "tictacti.com",
    "nativead.tech",
    "nextlandingads.xyz",
    "voluumtrk.com",
    "onclickads.net",
    "leadzuaf.com",
    "popcash.net",
    "r7mediar.com",
    "popads.net",
    "exdynsrv.com",
    "toolsackie.info",
    "trk-optimize.com",
    "twubs.com",
    "ucweb.com",
    "voluumtrk2.com",
    "adk2x.com",
    "blogger.com",
    "brightonclick.com",
    "clickmngr.com",
    "isanalyze.com",
    "maxonclick.com",
    "onclickpredictiv.com",
    "sgad.info",
    "starvegas.it",
    "terraclicks.com",
    "wwwpromoter.com",
    "ad-maven.com",
    "pdn-2.com",
    "yie4zooseif.info",
    "boudja.com",
    "cloudfront.net",
    "62.210.25.32",
    "revcontent.com",
    "turngrind.com",
    "dailyapk.net",
    "142.91.159.87",
    "142.91.159.84",
    "142.91.159.215",
    "www.adskeeper.co.uk",
    "remtoaku.net",
    "lb.usemaxserver.de",
    "tracking.klickthru.com",
    "gsmtop.net",
    "click.buzzcity.net",
    "ads.admoda.com",
    "stats.pflexads.com",
    "a.glcdn.co",
    "wwww.adleads.com",
    "ad.madvertise.de",
    "apps.buzzcity.net",
    "ads.mobgold.com",
    "android.bcfads.com",
    "show.buzzcity.net",
    "api.analytics.omgpop.com",
    "r.edge.inmobicdn.net",
    "www.mmnetwork.mobi",
    "img.ads.huntmad.com",
    "creative1cdn.mobfox.com",
    "admicro2.vcmedia.vn",
    "admicro1.vcmedia.vn",
    "s3.phluant.com",
    "c.vrvm.com",
    "go.vrvm.com",
    "static.estebull.com",
    "mobile.banzai.it",
    "ads.xxxad.net",
    "img.ads.mojiva.com",
    "adcontent.saymedia.com",
    "ads.saymedia.com",
    "ftpcontent.worldnow.com",
    "s0.2mdn.net",
    "img.ads.mocean.mobi",
    "bigmobileads.com",
    "banners.bigmobileads.com",
    "ads.mopub.com",
    "images.mpression.net",
    "images.millennialmedia.com",
    "oasc04012.247realmedia.com",
    "assets.cntdy.mobi",
    "ad.leadboltapps.net",
    "api.airpush.com",
    "ad.where.com",
    "i.tapit.com",
    "cdn1.crispadvertising.com",
    "cdn2.crispadvertising.com",
    "medrx.sensis.com.au",
    "rs-staticart.ybcdn.net",
    "img.ads.taptapnetworks.com",
    "adserver.ubiyoo.com",
    "c753738.r38.cf2.rackcdn.com",
    "edge.reporo.net",
    "ads.n-ws.org",
    "adultmoda.com",
    "ads.smartdevicemedia.com",
    "b.scorecardresearch.com",
    "m.adsymptotic.com",
    "cdn.vdopia.com",
    "api.yp.com",
    "asotrack1.fluentmobile.com",
    "android-sdk31.transpera.com",
    "apps.mobilityware.com",
    "ads.mobilityware.com",
    "ads.admarvel.com",
    "netdna.reporo.net",
    "www.eltrafiko.com",
    "cdn.trafficforce.com",
    "gts-ads.twistbox.com",
    "static.cdn.gtsmobi.com",
    "ads.matomymobile.com",
    "ads.adiquity.com",
    "img.ads.mobilefuse.net",
    "as.adfonic.net",
    "media.mobpartner.mobi",
    "cdn.us.goldspotmedia.com",
    "ads2.mediaarmor.com",
    "cdn.nearbyad.com",
    "ads.ookla.com",
    "mobiledl.adobe.com",
    "ads.flurry.com",
    "gemini.yahoo.com",
    "d3anogn3pbtk4v.cloudfront.net",
    "d3oltyb66oj2v8.cloudfront.net",
    "d2bgg7rjywcwsy.cloudfront.net",
    "a.vserv.mobi",
    "admin.vserv.mobi",
    "c.vserv.mobi",
    "ads.vserv.mobi",
    "sf.vserv.mobi",
    "hybl9bazbc35.pflexads.com",
    "hhbekxxw5d9e.pflexads.com",
    "www.pflexads.com",
    "orencia.pflexads.com",
    "atti.velti.com",
    "ru.velti.com",
    "mwc.velti.com",
    "cdn.celtra.com",
    "ads.celtra.com",
    "cache-ssl.celtra.com",
    "cache.celtra.com",
    "track.celtra.com",
    "wv.inner-active.mobi",
    "cdn1.inner-active.mobi",
    "m2m1.inner-active.mobi",
    "bos-tapreq01.jumptap.com",
    "bos-tapreq02.jumptap.com",
    "bos-tapreq03.jumptap.com",
    "bos-tapreq04.jumptap.com",
    "bos-tapreq05.jumptap.com",
    "bos-tapreq06.jumptap.com",
    "bos-tapreq07.jumptap.com",
    "bos-tapreq08.jumptap.com",
    "bos-tapreq09.jumptap.com",
    "bos-tapreq10.jumptap.com",
    "bos-tapreq11.jumptap.com",
    "bos-tapreq12.jumptap.com",
    "bos-tapreq13.jumptap.com",
    "bos-tapreq14.jumptap.com",
    "bos-tapreq15.jumptap.com",
    "bos-tapreq16.jumptap.com",
    "bos-tapreq17.jumptap.com",
    "bos-tapreq18.jumptap.com",
    "bos-tapreq19.jumptap.com",
    "bos-tapreq20.jumptap.com",
    "web64.jumptap.com",
    "web63.jumptap.com",
    "web65.jumptap.com",
    "bo.jumptap.com",
    "i.jumptap.com",
    "a.applovin.com",
    "d.applovin.com",
    "pdn.applovin.com",
    "mobpartner.mobi",
    "go.mobpartner.mobi",
    "r.mobpartner.mobi",
    "uk-ad2.adinfuse.com",
    "adinfuse.com",
    "go.adinfuse.com",
    "ad1.adinfuse.com",
    "ad2.adinfuse.com",
    "sky.adinfuse.com",
    "orange-fr.adinfuse.com",
    "sky-connect.adinfuse.com",
    "uk-go.adinfuse.com",
    "orangeuk-mc.adinfuse.com",
    "intouch.adinfuse.com",
    "funnel0.adinfuse.com",
    "cvt.mydas.mobi",
    "lp.mydas.mobi",
    "golds.lp.mydas.mobi",
    "suo.lp.mydas.mobi",
    "aio.lp.mydas.mobi",
    "lp.mp.mydas.mobi",
    "media.mydas.mobi",
    "ads.mp.mydas.mobi",
    "neptune.appads.com",
    "neptune1.appads.com",
    "neptune2.appads.com",
    "neptune3.appads.com",
    "saturn.appads.com",
    "saturn1.appads.com",
    "saturn2.appads.com",
    "saturn3.appads.com",
    "jupiter.appads.com",
    "jupiter1.appads.com",
    "jupiter2.appads.com",
    "jupiter3.appads.com",
    "req.appads.com",
    "req1.appads.com",
    "req2.appads.com",
    "req3.appads.com",
    "mc.yandex.ru",
    "an.yandex.ru",
    "swappit.tapad.com",
    "campaign-tapad.s3.amazonaws.com",
    "adsrv1.tapad.com",
    "ads1.mojiva.com",
    "ads2.mojiva.com",
    "ads3.mojiva.com",
    "ads4.mojiva.com",
    "ads5.mojiva.com",
    "i.w.inmobi.com",
    "r.w.inmobi.com",
    "c.w.inmobi.com",
    "adtracker.inmobi.com",
    "china.inmobi.com",
    "japan.inmobi.com",
    "mdn1.phluantmobile.net",
    "mdn2.phluantmobile.net",
    "mdn3.phluantmobile.net",
    "mdn3origin.phluantmobile.net",
    "soma.smaato.net",
    "c29new.smaato.net",
    "c01.smaato.net",
    "c02.smaato.net",
    "c03.smaato.net",
    "c04.smaato.net",
    "c05.smaato.net",
    "c06.smaato.net",
    "c07.smaato.net",
    "c08.smaato.net",
    "c09.smaato.net",
    "c10.smaato.net",
    "c11.smaato.net",
    "c12.smaato.net",
    "c13.smaato.net",
    "c14.smaato.net",
    "c15.smaato.net",
    "c16.smaato.net",
    "c17.smaato.net",
    "c18.smaato.net",
    "c19.smaato.net",
    "c20.smaato.net",
    "c21.smaato.net",
    "c22.smaato.net",
    "c23.smaato.net",
    "c24.smaato.net",
    "c25.smaato.net",
    "c26.smaato.net",
    "c27.smaato.net",
    "c28.smaato.net",
    "c29.smaato.net",
    "c30.smaato.net",
    "c31.smaato.net",
    "c32.smaato.net",
    "c33.smaato.net",
    "c34.smaato.net",
    "c35.smaato.net",
    "c36.smaato.net",
    "c37.smaato.net",
    "c38.smaato.net",
    "c39.smaato.net",
    "c40.smaato.net",
    "c41.smaato.net",
    "c42.smaato.net",
    "c43.smaato.net",
    "c44.smaato.net",
    "c45.smaato.net",
    "c46.smaato.net",
    "c47.smaato.net",
    "c48.smaato.net",
    "c49.smaato.net",
    "c50.smaato.net",
    "c51.smaato.net",
    "c52.smaato.net",
    "c53.smaato.net",
    "c54.smaato.net",
    "c55.smaato.net",
    "c56.smaato.net",
    "c57.smaato.net",
    "c58.smaato.net",
    "c59.smaato.net",
    "c60.smaato.net",
    "f03.smaato.net",
    "f04.smaato.net",
    "f05.smaato.net",
    "f06.smaato.net",
    "f07.smaato.net",
    "f08.smaato.net",
    "f09.smaato.net",
    "f10.smaato.net",
    "f11.smaato.net",
    "f12.smaato.net",
    "f13.smaato.net",
    "f14.smaato.net",
    "f15.smaato.net",
    "f16.smaato.net",
    "f17.smaato.net",
    "f18.smaato.net",
    "f19.smaato.net",
    "f20.smaato.net",
    "f21.smaato.net",
    "f22.smaato.net",
    "f23.smaato.net",
    "f24.smaato.net",
    "f25.smaato.net",
    "f26.smaato.net",
    "f27.smaato.net",
    "f28.smaato.net",
    "f29.smaato.net",
    "f30.smaato.net",
    "f31.smaato.net",
    "f32.smaato.net",
    "f33.smaato.net",
    "f34.smaato.net",
    "f35.smaato.net",
    "f36.smaato.net",
    "f37.smaato.net",
    "f38.smaato.net",
    "f39.smaato.net",
    "f40.smaato.net",
    "f41.smaato.net",
    "f42.smaato.net",
    "f43.smaato.net",
    "f44.smaato.net",
    "f45.smaato.net",
    "f46.smaato.net",
    "f47.smaato.net",
    "f48.smaato.net",
    "f49.smaato.net",
    "f50.smaato.net",
    "f51.smaato.net",
    "f52.smaato.net",
    "f53.smaato.net",
    "f54.smaato.net",
    "f55.smaato.net",
    "f56.smaato.net",
    "f57.smaato.net",
    "f58.smaato.net",
    "f59.smaato.net",
    "f60.smaato.net",
    "img.ads1.mojiva.com",
    "img.ads2.mojiva.com",
    "img.ads3.mojiva.com",
    "img.ads4.mojiva.com",
    "img.ads1.mocean.mobi",
    "img.ads2.mocean.mobi",
    "img.ads3.mocean.mobi",
    "img.ads4.mocean.mobi",
    "akamai.smartadserver.com",
    "cdn1.smartadserver.com",
    "diff.smartadserver.com",
    "diff2.smartadserver.com",
    "diff3.smartadserver.com",
    "eqx.smartadserver.com",
    "im2.smartadserver.com",
    "itx5-publicidad.smartadserver.com",
    "itx5.smartadserver.com",
    "tcy.smartadserver.com",
    "ww129.smartadserver.com",
    "ww13.smartadserver.com",
    "ww14.smartadserver.com",
    "ww234.smartadserver.com",
    "ww251.smartadserver.com",
    "ww264.smartadserver.com",
    "ww302.smartadserver.com",
    "ww362.smartadserver.com",
    "ww370.smartadserver.com",
    "ww381.smartadserver.com",
    "ww392.smartadserver.com",
    "ww55.smartadserver.com",
    "ww57.smartadserver.com",
    "ww84.smartadserver.com",
    "www.smartadserver.com",
    "www2.smartadserver.com",
    "www3.smartadserver.com",
    "www4.smartadserver.com",
    "ads.mobclix.com",
    "data.mobclix.com",
    "s.mobclix.com",
    "ads.mdotm.com",
    "cdn.mdotm.com",
    "ads2.greystripe.com",
    "adsx.greystripe.com",
    "c.greystripe.com",
    "aax-us-east.amazon-adsystem.com",
    "aax-us-west.amazon-adsystem.com",
    "s.amazon-adsystem.com",
    "admarvel.s3.amazonaws.com",
    "html5adkit.plusmo.s3.amazonaws.com",
    "inneractive-assets.s3.amazonaws.com",
    "strikeadcdn.s3.amazonaws.com",
    "a.admob.com",
    "analytics.admob.com",
    "c.admob.com",
    "media.admob.com",
    "p.admob.com",
    "met.adwhirl.com",
    "mob.adwhirl.com",
    "ad-g.doubleclick.net",
    "ad.doubleclick.net",
    "ad.mo.doubleclick.net",
    "doubleclick.net",
    "googleads.g.doubleclick.net",
    "pagead.googlesyndication.com",
    "pagead1.googlesyndication.com",
    "pagead2.googlesyndication.com",
    "events.foreseeresults.com",
    "survey.foreseeresults.com",
    "m.quantserve.com",
    "ad.leadboltmobile.net",
    "mobileads.msn.com",
    "img.adecorp.co.kr",
    "us0.adlibr.com",
    "ad.parrot.mable-inc.com",
    "aos.wall.youmi.net",
    "au.youmi.net",
    "coconuts.boy.jp",
    "iacpromotion.s3.amazonaws.com",
    "plugin.2easydroid.com",
    "adimg3.search.naver.net",
    "st.a-link.co.kr",
    "cdn.ajillionmax.com",
    "dispatch.admixer.co.kr",
    "ifc.inmobi.com",
    "thinknear-hosted.thinknearhub.com",
    "ads.adadapted.com",
    "analytics.localytics.com",
    "a.medialytics.com",
    "c.medialytics.com",
    "cdn.creative.medialytics.com",
    "p.medialytics.com",
    "px.cdn.creative.medialytics.com",
    "t.medialytics.com",
    "google-analytics.com",
    "googlesyndication.com",
    "applift.com",
    "trackersimulator.org",
    "eviltracker.net",
    "do-not-tracker.org",
    "adexchangegate.com",
    "forcedolphin.com",
    "163.172.224.35"
]
