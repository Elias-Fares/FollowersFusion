class PaymentResponse {
  final String invoiceId;
  final String amount;
  final String paymentStatus;
  final String? paymentId;
  final String? jsonObject;
  final String? errorMessage;

  const PaymentResponse({
    required this.invoiceId,
    required this.amount,
    required this.paymentStatus,
    this.paymentId,
    this.jsonObject,
    this.errorMessage,
  });

  Map<String, dynamic> toJson() {
    return {
      'invoice_id': invoiceId,
      'amount': amount,
      'payment_status': paymentStatus,
      'payment_id': paymentId,
      'response_object': jsonObject,
      'error_message': errorMessage,
    };
  }
}
