abstract class CartStates{}
class CartInitState extends CartStates{}
class AddToCart extends CartStates{}
class ErrorAddToCart extends CartStates{}
class GetCart extends CartStates{}
class ErrorGetCart extends CartStates{}
class GetTotal extends CartStates{}
class ErrorGetTotal extends CartStates{}
class DeleteCart extends CartStates{}
class ErrorDeleteCart extends CartStates{}
class UpdateQuantity extends CartStates{}
class ErrorUpdateQuantity extends CartStates{}
class ChangeQuantity extends CartStates{}
