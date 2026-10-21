{extends file="../../Remake/snippets/footer_modals.tpl"}

{block name='layout-footer-compare-modal' append}
    {$positionType = $Einstellungen.template.dropdowns.position_type}
    {lang section='custom' key='positionHeading' assign='titlePosition'}
    {if $positionType !== 'dropdown'}
        <div class="modal fade" id="positionModal">
            <div class="modal-dialog wish {if $positionType === 'modal-sidebar'}{$positionType} right{/if}">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="modal-title">{$titlePosition}</div>
                        <button type="button" class="close" data-dismiss="modal">
                            <span class="fas fa-times"></span>
                        </button>
                    </div>
                    <div class="modal-body- py-3 px-2">
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
            </div>
        </div>
    {/if}
{/block}