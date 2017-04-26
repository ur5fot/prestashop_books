
{block name="page_title"}
  <header class=page-header>
    <h1 class="h1"> {l s='Customer service - Contact us' d='Modules.Contactform.Shop'}</h1>
  </header>

{/block}

<section class="modules--contactform">

  <header>
    <h2 class="h2">{l s='Send a message' d='Modules.Contactform.Shop'}</h2>
      {*<p>{l s='If you would like to add a comment about your order, please write it in the field below.' d='Modules.Contactform.Shop'}</p>*}
  </header>
  <form action="{$urls.pages.contact}" method="post" {if $contact.allow_file_upload}enctype="multipart/form-data"{/if}>


    {if $notifications}
      <div class="notification {if $notifications.nw_error}notification-error{else}notification-success{/if}">
        <ul>
          {foreach $notifications.messages as $notif}
            <li>{$notif}</li>
          {/foreach}
        </ul>
      </div>
    {/if}

    <section class="form-fields">

      <label>
        <span>{l s='Subject Heading' d='Modules.Contactform.Shop'}</span>
        <select name="id_contact">
          {foreach from=$contact.contacts item=contact_elt}
            <option value="{$contact_elt.id_contact}">{$contact_elt.name}</option>
          {/foreach}
        </select>
      </label>

      <label>
        <span>{l s='Email address' d='Modules.Contactform.Shop'}</span>
        <input type="email" name="from" value="{$contact.email}" placeholder="main@mail.ru"/>
      </label>

      {if $contact.orders}
        <label>
          <span>{l s='Order reference' d='Modules.Contactform.Shop'}</span>
          <select name="id_order">
            <option value="">{l s='Select reference' d='Modules.Contactform.Shop'}</option>
            {foreach from=$contact.orders item=order}
              <option value="{$order.id_order}">{$order.reference}</option>
            {/foreach}
          </select>
        </label>
      {/if}

      {if $contact.allow_file_upload}
        <label>
          <span>{l s='Attach File' d='Modules.Contactform.Shop'}</span>
          <input type="file" name="fileUpload" />
        </label>
      {/if}

      <label>
        <span>{l s='Message' d='Modules.Contactform.Shop'}</span>
        <textarea cols="67" rows="3" name="message">{if $contact.message}{$contact.message}{/if}</textarea>
      </label>

    </section>

    <footer class="form-footer">
      <button type="submit" name="submitMessage" class="btn btn-yes">
        {l s='Send' d='Modules.Contactform.Shop'}
      </button>
    </footer>

  </form>
</section>


