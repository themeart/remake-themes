{block name='layout-footer'}

    {block name='layout-footer-content-all-closingtags'}
        {block name='layout-footer-aside'}
            {if !$bExclusive && $boxes.left !== null && !empty(trim(strip_tags($boxes.left)))
                && (($Einstellungen.template.theme.left_sidebar === 'Y' && $boxesLeftActive) || $smarty.const.PAGE_ARTIKELLISTE === $nSeitenTyp)}
                {block name='layout-footer-content-productlist-col-closingtag'}
                    </div>{* /col *}
                    {block name='layout-footer-sidepanel-left'}
                        {if !$isMobile || $isTablet}
                            <aside id="sidepanel_left" class="sidepanel-left d-print-none col-12 col-lg-3 col-xl-3 order-last order-lg-first dropdown-full-width d-none d-lg-block">
                                {block name='footer-sidepanel-left-content'}
                                    <div class="inner{if $Einstellungen.template.productlist.is_sticky === 'Y'} sticky-top{/if}">
                                        {opcMountPoint id='opc_before_sidepanel_boxes' inContainer=false}
                                        {$boxes.left}
                                        {opcMountPoint id='opc_after_sidepanel_boxes' inContainer=false}
                                    </div>
                                {/block}
                            </aside>
                        {/if}
                    {/block}
                {/block}
                {block name='layout-footer-content-productlist-row-closingtag'}
                    </div>{* /row *}
                {/block}
            {/if}
        {/block}

        {block name='layout-footer-content-closingtag'}
            {opcMountPoint id='opc_content' title='Default Area' inContainer=false}
            </div>{* /content *}
        {/block}

        {block name='layout-footer-content-wrapper-closingtag'}
            </div>{* /content-wrapper*}
        {/block}
    {/block}

    {block name='layout-footer-cart-modal'}
        {$cartType = $Einstellungen.template.shopping_cart.cart_type}
        {if $nSeitenTyp === $smarty.const.PAGE_ARTIKELLISTE || $nSeitenTyp === $smarty.const.PAGE_STARTSEITE}
            {$cartType = $Einstellungen.template.shopping_cart.listing_success}
        {elseif $nSeitenTyp === $smarty.const.PAGE_ARTIKEL}
            {$cartType = $Einstellungen.template.shopping_cart.details_success}
        {/if}
        {if $cartType !== 'dropdown'}
            {include file='basket/cart_modal.tpl'}
        {/if}
    {/block}
    {block name='layout-footer-account-modal'}
        {$accountType = $Einstellungen.template.dropdowns.account_type}
        {if $accountType !== 'dropdown'}
            {include file='layout/header_shop_nav_account_modal.tpl'}
        {/if}
    {/block}

    {block name='layout-footer-main-wrapper-closingtag'}
        </main> {* /mainwrapper *}
    {/block}

    {block name='layout-footer-logo'}
        {capture name="logo"}
            {include file='layout/header_logo.tpl' logoPosition='footer'}
        {/capture}
    {/block}

    {block name='layout-footer-socialmedia'}
        {capture name="socialmedia"}
            {include file='snippets/social_media.tpl'}
        {/capture}
    {/block}

    {block name='layout-footer-languages'}
        {capture name="languages"}
            {include file='snippets/language_dropdown.tpl' tag='div' label=true}
        {/capture}
    {/block}

    {block name='layout-footer-currency'}
        {capture name="currencies"}
            {include file='snippets/currency_dropdown.tpl' tag='div'}
        {/capture}
    {/block}

    {block name='layout-footer-include-last-seen'}
        {if !$bExclusive}
            {include file='snippets/last_seen.tpl'}
        {/if}
    {/block}

    {block name='layout-footer-newsletter'}
        {$newsletterLeisteActive = $Einstellungen.template.footer.newsletter_footer === 'Y' && $Einstellungen.newsletter.newsletter_active === 'Y'}
        {$newsletterPlaceholderActive = $Einstellungen.template.footer.newsletter_footer === 'N' && $Einstellungen.newsletter.newsletter_active === 'Y'}
        
        {* Anpassung - start *}
            {if $newsletterLeisteActive}
                {if !$bExclusive}
                    {include file='snippets/newsletter.tpl'}
                {/if}
            {/if}
            {capture name="newsletterbar"}
                {include file='snippets/newsletter.tpl' placeholder=true}
            {/capture}
        {* Anpassung - ende *}
    {/block}

    {block name='layout-footer-content'}
        {if !$bExclusive}
            {$newsletterActive = $Einstellungen.template.footer.newsletter_footer === 'Y'
                && $Einstellungen.newsletter.newsletter_active === 'Y'}
            {block name='layout-footer-contact-bar'}
                {if $nSeitenTyp !== $smarty.const.PAGE_BESTELLVORGANG}
                    {include file='snippets/contact_bar.tpl'}
                {/if}
            {/block}
            <footer id="footer" {if $newsletterActive}class="newsletter-active"{/if}>
                {container fluid=true class="container-fluid-xl d-print-none"}
                    {block name='layout-footer-boxes'}  
                        {$findContent = ['##logo##','##social##','##newsletter##','##language##','##currency##']}
                        {$replContent = [$smarty.capture.logo, $smarty.capture.socialmedia, $smarty.capture.newsletterbar, $smarty.capture.languages, $smarty.capture.currencies]}
                        {getBoxesByPosition position='bottom' assign='footerBoxes'}
                        {$gridFooterConfigLg = $Einstellungen.template.footer.grid_lg}
                        {$gridFooterConfigMd = $Einstellungen.template.footer.grid_md}
                        {if $gridFooterConfigLg}
                            {assign var='gridFooterLg' value=","|explode:$gridFooterConfigLg}
                        {/if}
                        {if $gridFooterConfigMd}
                            {assign var='gridFooterMd' value=","|explode:$gridFooterConfigMd}
                        {/if}
                        {if isset($footerBoxes) && count($footerBoxes) > 0}
                            {row id='footer-boxes'}
                            {assign var=fcounter value=0}
                            {foreach name='footerBoxes' from=$footerBoxes item='box'}
                                {assign var='boxContent' value=$box->getRenderedContent()}
                                {if $box->isActive() && !empty($boxContent)}
                                    {$lg = 3}
                                    {$md = 3}
                                    {assign var='fIndex' value=$fcounter++}
                                    {if isset($gridFooterLg.$fIndex)}
                                        {$lg = $gridFooterLg.$fIndex}
                                    {/if}
                                    {if isset($gridFooterMd.$fIndex)}
                                        {$md = $gridFooterMd.$fIndex}
                                    {/if}
                                    {col cols=12 sm=6 md=$md lg=$lg}
                                        {$boxContent|replace:$findContent:$replContent}
                                    {/col}
                                {/if}
                            {/foreach}
                            {/row}
                        {/if}
                    {/block}

                    {block name='layout-before-additional-opc'}
                        {opcMountPoint id='layout-before-footer-additional'}
                    {/block}

                    {if $Einstellungen.template.footer.socialmedia_footer === 'Y'}
                        {$smarty.capture.socialmedia}
                    {/if}
                {/container}
                {block name='layout-footer-copyright'}
                    <div id="copyright">
                        {container fluid=true class="container-fluid-xl d-print-none"}
                            {row class="justify-content-between"}
                                {assign var=isBrandFree value=JTL\Shop::isBrandfree()}
                                {block name='layout-footer-copyright-copyright'}
                                    {col cols=12 md='auto' class="text-center text-md-left order-2 order-lg-1"}
                                        {if !empty($meta_copyright)}
                                            <span class="icon-mr-2" itemprop="copyrightHolder">&copy; {$meta_copyright}</span>
                                        {/if}
                                        <span class="footnote-vat">
                                            {if $NettoPreise == 1}
                                                {lang key='footnoteExclusiveVat' assign='footnoteVat'}
                                            {else}
                                                {lang key='footnoteInclusiveVat' assign='footnoteVat'}
                                            {/if}
                                            {if isset($oSpezialseiten_arr[$smarty.const.LINKTYP_VERSAND])}
                                                {if $Einstellungen.global.global_versandhinweis === 'zzgl'}
                                                    {lang key='footnoteExclusiveShipping' printf=$oSpezialseiten_arr[$smarty.const.LINKTYP_VERSAND]->getURL() assign='footnoteShipping'}
                                                {elseif $Einstellungen.global.global_versandhinweis === 'inkl'}
                                                    {lang key='footnoteInclusiveShipping' printf=$oSpezialseiten_arr[$smarty.const.LINKTYP_VERSAND]->getURL() assign='footnoteShipping'}
                                                {/if}
                                            {/if}
                                            {block name='footer-vat-notice'}
                                                * {$footnoteVat}{if isset($footnoteShipping)}{$footnoteShipping}{/if}
                                            {/block}
                                        </span>
                                        {if $Einstellungen.global.global_zaehler_anzeigen === 'Y'}
                                            {lang key='counter'}: {$Besucherzaehler}
                                        {/if}
                                        {if !empty($Einstellungen.global.global_fusszeilehinweis)}
                                            <span class="ml-2">{$Einstellungen.global.global_fusszeilehinweis}</span>
                                        {/if}
                                    {/col}
                                {/block}
                                {col cols=12 md='auto' lg=4 class="text-center text-md-right order-3"}
                                    {block name='theme-vendor'}
                                        <span class="pl-5">
                                            Developed by {link href="https://www.themeart.de" class="text-decoration-underline" title="Themeart" target="_blank" rel="noopener nofollow"}Themeart{/link}
                                        </span>
                                    {/block}
                                    {if !$isBrandFree}
                                        {block name='layout-footer-copyright-brand'}
                                            <span class="pl-3" id="system-credits">
                                                Powered by {link href="https://jtl-url.de/jtlshop" class="text-decoration-underline" title="JTL-Shop" target="_blank" rel="noopener nofollow"}JTL-Shop{/link}
                                            </span>
                                        {/block}
                                    {/if}
                                {/col}
                            {/row}
                        {/container}
                    </div>
                {/block}
                {block name='layout-footer-scroll-top'}
                    {if $Einstellungen.template.theme.button_scroll_top === 'Y'}
                        {include file='snippets/scroll_top.tpl'}
                    {/if}
                {/block}
            </footer>
        {/if}
    {/block}

    {block name='layout-footer-io-path'}
        <div id="jtl-io-path" data-path="{$ShopURL}" class="d-none"></div>
    {/block}

    {* JavaScripts *}
    {block name='layout-footer-js'}
        {$dbgBarBody}
        {captchaMarkup getBody=false}
    {/block}

    {block name='layout-footer-consent-manager'}
        {if $Einstellungen.consentmanager.consent_manager_active === 'Y' && !$isAjax && $consentItems->isNotEmpty()}
            <input id="consent-manager-show-banner" type="hidden" value="{$Einstellungen.consentmanager.consent_manager_show_banner}">
            {include file='snippets/consent_manager.tpl'}
            {inline_script}
                <script>
                    {if $Einstellungen.template.consent.consent_hide_button === 'N'}
                    setTimeout(function() {
                        $('#consent-manager, #consent-settings-btn').removeClass('d-none');
                    }, 100)
                    {/if}
                    document.addEventListener('consent.updated', function(e) {
                        $.post('{$ShopURLSSL}/_updateconsent', {
                                'action': 'updateconsent',
                                'jtl_token': '{$smarty.session.jtl_token}',
                                'data': e.detail
                            }
                        );
                    });
                    {if !isset($smarty.session.consents)}
                        document.addEventListener('consent.ready', function(e) {
                            document.dispatchEvent(new CustomEvent('consent.updated', { detail: e.detail }));
                        });
                    {/if}

                    window.CM = new ConsentManager({
                        version: {$smarty.session.consentVersion|default:1}
                    });
                    var trigger = document.querySelectorAll('.trigger')
                    var triggerCall = function(e) {
                        e.preventDefault();
                        let type = e.target.dataset.consent;
                        if (CM.getSettings(type) === false) {
                            CM.openConfirmationModal(type, function() {
                                let data = CM._getLocalData();
                                if (data === null ) {
                                    data = { settings: {} };
                                }
                                data.settings[type] = true;
                                document.dispatchEvent(new CustomEvent('consent.updated', { detail: data.settings }));
                            });
                        }
                    }
                    for (let i = 0; i < trigger.length; ++i) {
                        trigger[i].addEventListener('click', triggerCall)
                    }
                </script>
            {/inline_script}
        {/if}
    {/block}
    </body>
    </html>
{/block}
