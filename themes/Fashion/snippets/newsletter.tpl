
{block name='layout-footer-newsletter-alone'}
    {if $nSeitenTyp == $smarty.const.PAGE_STARTSEITE}
    {opcMountPoint id='fashion-newesletter-before'}
    <div class="container newsletter-wrapper">
        {container class="d-print-none"}
            <div class="newsletter-inner">
            {row class="newsletter-footer no-gutters align-items-center justify-content-between"}
                {col cols=12 lg=4}
                    {opcMountPoint id='fashion-newesletter-image'}
                {/col}
                {col cols=12 lg=8 lx=8}
                    <div class="newsletter-inner-box">
                        {$newsletterHeading = {lang key='newsletter-heading' section='custom'}}
                        {if $newsletterHeading !== '#custom.newsletter-heading#'}<div class="newsletter-title">{$newsletterHeading}</div>{/if}
                        {opcMountPoint id='fashion-newesletter-desk'}
                                            
                        {form methopd="post" action="{get_static_route id='newsletter.php'}"}
                            {input type="hidden" name="abonnieren" value="2"}
                            {formgroup label-sr-only="{lang key='emailadress'}" class="newsletter-email-wrapper mb-0"}
                                {inputgroup}
                                    {input type="email" name="cEmail" id="newsletter_email" size-class='lg' placeholder="{lang key='emailadress'}" aria=['label' => {lang key='emailadress'}]}
                                    {inputgroupaddon append=true}
                                        {button aria=['label' => "{lang key='newsletterSendSubscribe' section='newsletter'}"] type='submit' variant='primary' size='lg' class='min-w-sm'}
                                            {lang key='newsletterSendSubscribe' section='newsletter'}
                                        {/button}
                                    {/inputgroupaddon}
                                {/inputgroup}
                            {/formgroup}
                            <div class="{if !empty($plausiArr.captcha) && $plausiArr.captcha === true} has-error{/if}">
                                {captchaMarkup getBody=true}
                            </div>
                        {/form}
                        {if isset($oSpezialseiten_arr[$smarty.const.LINKTYP_DATENSCHUTZ])}
                            <div class="info mt-3">
                                {lang key='newsletterInformedConsent' section='newsletter' printf=$oSpezialseiten_arr[$smarty.const.LINKTYP_DATENSCHUTZ]->getURL()}
                            </div>
                        {/if}
                    </div>
                {/col}
            {/row}
            </div>
        {/container}
    </div>
    {opcMountPoint id='fashion-newesletter-after'}
    {/if}
{/block}