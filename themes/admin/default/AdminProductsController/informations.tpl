{*
* 2007-2012 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2012 PrestaShop SA
*  @version  Release: $Revision: 14143 $
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
<div id="step1">
	<h4 class="tab">1. {l s='Info.' mod='germanext'}</h4>
	<h4>{l s='Product global information' mod='germanext'}</h4>
	<script type="text/javascript">
		{if isset($PS_ALLOW_ACCENTED_CHARS_URL) && $PS_ALLOW_ACCENTED_CHARS_URL}
			var PS_ALLOW_ACCENTED_CHARS_URL = 1;
		{else}
			var PS_ALLOW_ACCENTED_CHARS_URL = 0;
		{/if}
		{$combinationImagesJs}
	</script>
	<div class="separation"></div>
	<div>
		<label class="text">{l s='Type:' mod='germanext'}</label>
		<input type="radio" name="type_product" id="simple_product" value="{Product::PTYPE_SIMPLE}" {if (isset($smarty.post.type_product) && Product::PTYPE_SIMPLE == $smarty.post.type_product)}checked="checked"{/if} />
		<label class="radioCheck" for="simple_product">{l s='Product' mod='germanext'}</label>
		<input type="radio" name="type_product" {if $is_in_pack}disabled="disabled"{/if} id="pack_product" value="{Product::PTYPE_PACK}" {if $product_type == Product::PTYPE_PACK}checked="checked"{/if} />
		<label class="radioCheck" for="pack_product">{l s='Pack' mod='germanext'}</label>
		<input type="radio" name="type_product" id="virtual_product" {if $is_in_pack}disabled="disabled"{/if} value="{Product::PTYPE_VIRTUAL}" {if $product_type == Product::PTYPE_VIRTUAL}checked="checked"{/if} />
		<label class="radioCheck" for="virtual_product">{l s='Virtual Product (services, booking or downloadable products)' mod='germanext'}</label>
	</div>

	<div class="separation"></div>
	<br />
	<table cellpadding="5" style="width: 50%; float: left; margin-right: 20px; border-right: 1px solid #CCCCCC;">
	{* global information *}
		<tr>
			<td class="col-left"><label>{l s='Name:' mod='germanext'}</label></td>
			<td style="padding-bottom:5px;" class="translatable">
			{foreach from=$languages item=language}
				<div class="lang_{$language.id_lang}" style="{if !$language.is_default}display: none;{/if} float: left;">
					<input class="{if !$product->id}copy2friendlyUrl{/if} updateCurrentText" size="43" type="text" {if !$product->id}disabled="disabled"{/if}
						id="name_{$language.id_lang}" name="name_{$language.id_lang}"
						value="{$product->name[$language.id_lang]|htmlentitiesUTF8|default:''}"/><sup> *</sup>
					<span class="hint" name="help_box">{l s='Invalid characters:' mod='germanext'} <>;=#{}<span class="hint-pointer">&nbsp;</span>
					</span>
				</div>
			{/foreach}

			</td>
		</tr>
		<tr>
			<td class="col-left"><label>{l s='Reference:' mod='germanext'}</label></td>
			<td style="padding-bottom:5px;">
				<input size="55" type="text" name="reference" value="{$product->reference|htmlentitiesUTF8}" style="width: 130px; margin-right: 44px;" />
				<span class="hint" name="help_box">{l s='Special characters allowed:' mod='germanext'}.-_#\<span class="hint-pointer">&nbsp;</span></span>
			</td>
		</tr>
		<tr>
			<td class="col-left"><label>{l s='EAN13 or JAN:' mod='germanext'}</label></td>
			<td style="padding-bottom:5px;">
				<input size="55" maxlength="13" type="text" name="ean13" value="{$product->ean13|htmlentitiesUTF8}" style="width: 130px; margin-right: 5px;" /> <span class="small">{l s='(Europe, Japan)' mod='germanext'}</span>
			</td>
		</tr>
		<tr>
			<td class="col-left"><label>{l s='UPC:' mod='germanext'}</label></td>
			<td style="padding-bottom:5px;">
				<input size="55" maxlength="12" type="text" name="upc" value="{$product->upc}" style="width: 130px; margin-right: 5px;" /> <span class="small">{l s='(US, Canada)' mod='germanext'}</span>
			</td>
		</tr>
	</table>
	{* status informations *}
	<table cellpadding="5" style="width: 40%; float: left; margin-left: 10px;">
	<tr>
		<td class="col-left">
			<label class="text">{l s='Status:' mod='germanext'}</label>
		</td>
		<td style="padding-bottom:5px;">
			<ul class="listForm">
				<li>
					<input onclick="toggleDraftWarning(false);showOptions(true);showRedirectProductOptions(false);" type="radio" name="active" id="active_on" value="1" {if $product->active || !$product->isAssociatedToShop()}checked="checked" {/if} />
					<label for="active_on" class="radioCheck">{l s='Enabled' mod='germanext'}</label>
				</li>
				<li>
					<input onclick="toggleDraftWarning(true);showOptions(false);showRedirectProductOptions(true);"  type="radio" name="active" id="active_off" value="0" {if !$product->active && $product->isAssociatedToShop()}checked="checked"{/if} />
					<label for="active_off" class="radioCheck">{l s='Disabled' mod='germanext'}</label>
				</li>
			</ul>
		</td>
	</tr>
	<tr class="redirect_product_options" style="display:none">
		<td class="col-left">
			{include file="controllers/products/multishop/checkbox.tpl" field="active" type="radio" onclick=""}
			<label class="text">{l s='Redirect:'}</label>
		</td>
		<td style="padding-bottom:5px;">
			<select name="redirect_type" id="redirect_type">
				<option value="404" {if $product->redirect_type == '404'} selected="selected" {/if}>{l s='No redirect (404)'}</option>
				<option value="301" {if $product->redirect_type == '301'} selected="selected" {/if}>{l s='Redirect permanently (301)'}</option>
				<option value="302" {if $product->redirect_type == '302'} selected="selected" {/if}>{l s='Redirect temporarily (302)'}</option>
			</select>
			<span class="hint" name="help_box">
				{l s='404 : Not Found = Product does not exist and no redirect'}<br/>
				{l s='301 : Moved Permanently = Product Moved Permanently'}<br/>
				{l s='302 : Moved Temporarily = Product moved temporarily'}
			</span>
		</td>
	</tr>
	<tr class="redirect_product_options redirect_product_options_product_choise" style="display:none">
		<td class="col-left">
			{include file="controllers/products/multishop/checkbox.tpl" field="active" type="radio" onclick=""}
			<label class="text">{l s='Related product:'}</label>
		</td>
		<td style="padding-bottom:5px;">
			<input type="hidden" value="" name="id_product_redirected" />
			<input value="" id="related_product_autocomplete_input" autocomplete="off" class="ac_input" />
			<p>
				<script>
					var no_related_product = '{l s='No related product'}';
					var id_product_redirected = {$product->id_product_redirected|intval};
					var product_name_redirected = '{$product_name_redirected|escape:html:'UTF-8'}';
				</script>
				<span id="related_product_name">{l s='No related product'}</span>
				<span id="related_product_remove" style="display:none">
					<a hre="#" onclick="removeRelatedProduct(); return false" id="related_product_remove_link">
						<img src="../img/admin/delete.gif" class="middle" alt="" />
					</a>
				</span>
			</p>
		</td>
	</tr>
	<tr>
		<td class="col-left"><label>{l s='Visibility:' mod='germanext'}</label></td>
		<td style="padding-bottom:5px;">
			<select name="visibility" id="visibility">
				<option value="both" {if $product->visibility == 'both'}selected="selected"{/if} >{l s='Everywhere' mod='germanext'}</option>
				<option value="catalog" {if $product->visibility == 'catalog'}selected="selected"{/if} >{l s='Catalog only' mod='germanext'}</option>
				<option value="search" {if $product->visibility == 'search'}selected="selected"{/if} >{l s='Search only' mod='germanext'}</option>
				<option value="none" {if $product->visibility == 'none'}selected="selected"{/if}>{l s='Nowhere' mod='germanext'}</option>
			</select>
		</td>
	</tr>
	<tr id="product_options" {if !$product->active}style="display:none"{/if} >
		<td class="col-left"><label>{l s='Options:' mod='germanext'}</label></td>
		<td style="padding-bottom:5px;">
			<ul class="listForm">
				<li><input  type="checkbox" name="available_for_order" id="available_for_order" value="1" {if $product->available_for_order}checked="checked"{/if}  />
			<script type="text/javascript">
			$(document).ready(function()
			{
				$("#available_for_order").click(function(){
					if ($(this).is(':checked'))
					{
						$('#show_price').attr('checked', 'checked');
						$('#show_price').attr('disabled', 'disabled');
					}
					else
					{
						$('#show_price').attr('disabled', '');
					}
				});
			});
			</script>
			<label for="available_for_order" class="t">{l s='Available for order' mod='germanext'}</label></li>
			<li>
			<input type="checkbox" name="show_price" id="show_price" value="1" {if $product->show_price}checked="checked"{/if} {if $product->available_for_order}disabled="disabled"{/if}/>
			<label for="show_price" class="t">{l s='show price' mod='germanext'}</label>
			</li>
			<li>
			<input type="checkbox" name="online_only" id="online_only" value="1" {if $product->online_only}checked="checked"{/if} />
			<label for="online_only" class="t">{l s='Online only (not sold in store)' mod='germanext'}</label>
			</li>
		</td>
	</tr>
	<tr>
		<td class="col-left"><label>{l s='Condition:' mod='germanext'}</label></td>
		<td style="padding-bottom:5px;">
			<select name="condition" id="condition">
				<option value="new" {if $product->condition == 'new'}selected="selected"{/if} >{l s='New' mod='germanext'}</option>
				<option value="used" {if $product->condition == 'used'}selected="selected"{/if} >{l s='Used' mod='germanext'}</option>
				<option value="refurbished" {if $product->condition == 'refurbished'}selected="selected"{/if}>{l s='Refurbished' mod='germanext'}</option>
			</select>
		</td>
	</tr>
	</ul>
</table>

<table cellpadding="5" cellspacing="0" border="0" style="width: 100%;"><tr><td><div class="separation"></div></td></tr></table>
		<table cellspacing="0" cellpadding="5" border="0">
			<tr>
				<td class="col-left"><label>{l s='Short description:' mod='germanext'}<br /></label><p class="product_description">({l s='Appears in the product list(s), and on the top of the product page.' mod='germanext'})</p></td>
				<td style="padding-bottom:5px;">
						{include file="controllers/products/textarea_lang.tpl"
						languages=$languages
						input_name='description_short'
						input_value=$product->description_short
						max=$PS_PRODUCT_SHORT_DESC_LIMIT}
					<p class="clear"></p>
				</td>
			</tr>
			<tr>
				<td class="col-left"><label>{l s='Description:' mod='germanext'}<br /></label><p class="product_description">({l s='Appears in the body of the product page' mod='germanext'})</p></td>
				<td style="padding-bottom:5px;">
						{include file="controllers/products/textarea_lang.tpl" languages=$languages
						input_name='description'
						input_value=$product->description
						}
					<p class="clear"></p>
				</td>
			</tr>
		{if $images}
			<tr>
				<td class="col-left"><label></label></td>
				<td style="padding-bottom:5px;">
					<div style="display:block;width:620px;" class="hint clear">
						{l s='Do you want an image associated with the product in your description?' mod='germanext'}
						<span class="addImageDescription" style="cursor:pointer">{l s='Click here' mod='germanext'}</span>.
					</div>
					<p class="clear"></p>
				</td>
			</tr>
			</table>
				<table id="createImageDescription" style="display:none;width:100%">
					<tr>
						<td colspan="2" height="10"></td>
					</tr>
					<tr>
						<td class="col-left"><label>{l s='Select your image:' mod='germanext'}</label></td>
						<td style="padding-bottom:5px;">
							<ul class="smallImage">
							{foreach from=$images item=image key=key}
									<li>
										<input type="radio" name="smallImage" id="smallImage_{$key}" value="{$image.id_image}" {if $key == 0}checked="checked"{/if} >
										<label for="smallImage_{$key}" class="t">
											<img src="{$image.src}" alt="{$image.legend}" />
										</label>
									</li>
							{/foreach}
							</ul>
							<p class="clear"></p>
						</td>
					</tr>
					<tr>
						<td class="col-left"><label>{l s='Where to place it?' mod='germanext'}</label></td>
						<td style="padding-bottom:5px;">
							<ul class="listForm">
								<li><input type="radio" name="leftRight" id="leftRight_1" value="left" checked>
									<label for="leftRight_1" class="t">{l s='left' mod='germanext'}</label>
								</li>
								<li>
									<input type="radio" name="leftRight" id="leftRight_2" value="right">
									<label for="leftRight_2" class="t">{l s='right' mod='germanext'}</label>
								</li>
							</ul>
						</td>
					</tr>
					<tr>
						<td class="col-left"><label>{l s='Select the type of picture:' mod='germanext'}</label></td>
						<td style="padding-bottom:5px;">
							<ul class="listForm">
							{foreach from=$imagesTypes key=key item=type}
								<li><input type="radio" name="imageTypes" id="imageTypes_{$key}" value="{$type.name}" {if $key == 0}checked="checked"{/if}>
									<label for="imageTypes_{$key}" class="t">{$type.name} <span>({$type.width}px par {$type.height}px)</span></label>
								</li>
							{/foreach}
							</ul>
							<p class="clear"></p>
						</td>
					</tr>
					<tr>
						<td class="col-left"><label>{l s='Image tag to insert:' mod='germanext'}</label></td>
						<td style="padding-bottom:5px;">
							<input type="text" id="resultImage" name="resultImage" />
							<p class="preference_description">{l s='The tag is to copy/paste in the description.' mod='germanext'}</p>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="separation"></div>
						</td>
					</tr>
				</table>
			<script type="text/javascript">
				$(function() {
					changeTagImage();
					$('#createImageDescription input').change(function(){
						changeTagImage();
					});

					var i = 0;
					$('.addImageDescription').click(function(){
						if (i == 0){
							$('#createImageDescription').animate({
								opacity: 1, height: 'toggle'
								}, 500);
							i = 1;
						}else{
							$('#createImageDescription').animate({
								opacity: 0, height: 'toggle'
								}, 500);
							i = 0;
						}
					});
				});

				function changeTagImage(){
					var smallImage = $('input[name=smallImage]:checked').attr('value');
					var leftRight = $('input[name=leftRight]:checked').attr('value');
					var imageTypes = $('input[name=imageTypes]:checked').attr('value');
					var tag = '[img-'+smallImage+'-'+leftRight+'-'+imageTypes+']';
					$('#resultImage').val(tag);
				}
			</script>
		{/if}
		<table>
		<tr>
			<td class="col-left"><label>{l s='Tags:' mod='germanext'}</label></td>
			<td style="padding-bottom:5px;" class="translatable">
				{foreach from=$languages item=language}
					<div class="lang_{$language.id_lang}" style="{if !$language.is_default}display: none;{/if}float: left;">
						<input size="55" type="text" id="tags_{$language.id_lang}" name="tags_{$language.id_lang}"
							value="{$product->getTags($language.id_lang, true)|htmlentitiesUTF8}" />
						<span class="hint" name="help_box">{l s='Forbidden characters:' mod='germanext'} !&lt;;&gt;;?=+#&quot;&deg;{}_$%<span class="hint-pointer">&nbsp;</span></span>
					</div>
				{/foreach}
				<p class="preference_description clear">{l s='Tags separated by commas (e.g. dvd, dvd player, hifi)' mod='germanext'}</p>
			</td>
		</tr>
		</table>
	</table>
	<br />
</div>

