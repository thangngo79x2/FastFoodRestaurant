package com.webmvc.chiken.model.entity;
import java.util.*;

import com.paypal.api.payments.*;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.PayerInfo;
import com.paypal.base.rest.*;
public class PaymentServices {
    private static final String CLIENT_ID = "ATmCfSzNKmDzaPZVDDd4uYSurXij4feYQHJ-rrnJ_LlkpKxA0hi37hTG3UMEmDVi3chEkI15zs-tm5b3";
    private static final String CLIENT_SECRET = "EERAWDIFkd3smqmBMMX9hz3CYXlUedHwskF_6iAKPXb_z5AGzpSjZdRgphUs1YVAVP8qJ5pmbB14wNUA";
    private static final String MODE = "sandbox";

    public String authorizePayment(OrderDetails orderDetail)
            throws PayPalRESTException {

        Payer payer = getPayerInformation();
        RedirectUrls redirectUrls = getRedirectURLs();
        List<Transaction> listTransaction = getTransactionInformation(orderDetail);

        Payment requestPayment = new Payment();
        requestPayment.setTransactions(listTransaction);
        requestPayment.setRedirectUrls(redirectUrls);
        requestPayment.setPayer(payer);
        requestPayment.setIntent("authorize");

        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

        Payment approvedPayment = requestPayment.create(apiContext);
        System.out.println(approvedPayment);
        return getApprovalLink(approvedPayment);

    }

    private Payer getPayerInformation() {
        Payer payer = new Payer();
        payer.setPaymentMethod("paypal");

        PayerInfo payerInfo = new PayerInfo();
        payerInfo.setFirstName("Hoang")
                .setLastName("Nguyen")
                .setEmail("nvh610@personal.example.com");

        payer.setPayerInfo(payerInfo);
        return payer;
    }

    private RedirectUrls getRedirectURLs() {
        RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setCancelUrl("http://localhost:8080/FastFood_war_exploded/bill.jsp");
        redirectUrls.setReturnUrl("http://localhost:8080/FastFood_war_exploded/review_payment");
        return redirectUrls;
    }
    public Payment getPaymentDetails(String paymentId) throws PayPalRESTException{
        APIContext aPIContext = new APIContext(CLIENT_ID,CLIENT_SECRET,MODE);
        return Payment.get(aPIContext, paymentId);
    }
    public Payment executePayment(String paymentId,String payerId) throws PayPalRESTException{
        PaymentExecution execution = new PaymentExecution();
        execution.setPayerId(payerId);
        Payment payment = new Payment().setId(paymentId);
        APIContext aPIContext = new APIContext(CLIENT_ID,CLIENT_SECRET,MODE);
        return payment.execute(aPIContext, execution);
    }

    private List<Transaction> getTransactionInformation(OrderDetails orderDetail) {
        Details details = new Details();
        details.setSubtotal(orderDetail.getTotal());


        Amount amount = new Amount();
        amount.setCurrency("USD");
        amount.setTotal(orderDetail.getTotal());
        amount.setDetails(details);
        Transaction transaction = new Transaction();
        transaction.setAmount(amount);
        ItemList itemList = new ItemList();
        List<Item> items = new ArrayList<>();
        Item item = new Item();
        item.setCurrency("USD")
                .setPrice(orderDetail.getTotal())
                .setQuantity("1");

        items.add(item);
        itemList.setItems(items);
        transaction.setItemList(itemList);
        List<Transaction> listtransactions = new ArrayList<Transaction>();
        listtransactions.add(transaction);

        return listtransactions;
    }

    private String getApprovalLink(Payment approvedPayment) {
        List<Links> linkses = approvedPayment.getLinks();
        String approvalLinks = null;
        for (Links linkse : linkses) {
            if(linkse.getRel().equalsIgnoreCase("approval_url")){
                approvalLinks = linkse.getHref();
            }
        }
        return approvalLinks;
    }
}
