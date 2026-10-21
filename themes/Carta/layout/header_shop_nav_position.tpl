{lang section='custom' key='positionHeading' assign='titlePosition'}
{$style = $style|default:'mr-6 mr-lg-4'}
{$positionType = $Einstellungen.template.dropdowns.position_type}

<{$tag|default:'div'} id='shop-nav-position'
    class="nav-item dropdown dropasset {$style}">
    {link class='nav-link' title=$titlePosition 
        aria=['expanded' => 'false', 'label' => $titlePosition,'controls' => 'positionModal'] 
        data=['target' => "{if $positionType!='dropdown'}#positionModal{/if}",'toggle' => "{if $positionType=='modal-sidebar'}modal{else}{$positionType}{/if}"]
    }
        <i class="fa-solid fa-location-pin mr-2"></i>
        <span class='nav-label'>0</span>
    {/link}
    {if $positionType === 'dropdown'}
    <div class="dropdown-menu dropdown-menu-left lg-min-w-lg">
        <div class="dropdown-body">
            <span class="h3">{$titlePosition}</span>
            <div class="pt-1 pb-3">{lang key='infoPosition' section='custom'}</div>
            {form action="{get_static_route id='jtl.php' secure=true}" method="post" class="jtl-validate" slide=true}
                <fieldset id="quick-position">
                    <legend class="d-none">
                        {lang key='loginForRegisteredCustomers' section='checkout'}
                    </legend>
                    {formgroup label-for="email_quick" label={lang section='custom' key='reservation'}}
                        {input type="text" name="table-reservation" id="reservation_quick" 
                            placeholder="0" required=true}
                    {/formgroup}
                    {if !empty($oRedirect->cURL)}
                        {foreach $oRedirect->oParameter_arr as $oParameter}
                            {input type="hidden" name=$oParameter->Name value=$oParameter->Wert}
                        {/foreach}
                        {input type="hidden" name="r" value=$oRedirect->nRedirect}
                        {input type="hidden" name="cURL" value=$oRedirect->cURL}
                    {/if}
                    {button type="submit" id="submit-btn" block=true variant="primary"}{lang section='custom' key='postionAccept'}{/button}
                </fieldset>
            {/form}
        </div>
    </div>
    {/if}
</{$tag|default:'div'}>