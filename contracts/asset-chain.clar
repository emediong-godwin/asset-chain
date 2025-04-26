;; Title: AssetChain - Real World Asset Tokenization Platform
;; 
;; Summary: A Clarity smart contract enabling the tokenization of real-world assets 
;; on the Stacks blockchain with Bitcoin-backed security and compliance features.
;; 
;; Description: This contract provides functionality for asset registration, fractional 
;; ownership, dividend distribution, and decentralized governance. It includes KYC 
;; compliance controls, price oracles, and voting mechanisms designed to meet regulatory
;; requirements while enabling broader access to traditionally illiquid assets.
;; 

;; Constants

;; Administrative
(define-constant contract-owner tx-sender)

;; Error codes - Access control
(define-constant err-owner-only (err u100))
(define-constant err-not-authorized (err u104))

;; Error codes - Asset management
(define-constant err-not-found (err u101))
(define-constant err-already-listed (err u102))
(define-constant err-invalid-amount (err u103))

;; Error codes - Compliance
(define-constant err-kyc-required (err u105))
(define-constant err-price-expired (err u108))

;; Error codes - Governance
(define-constant err-vote-exists (err u106))
(define-constant err-vote-ended (err u107))

;; Error codes - Validation
(define-constant err-invalid-uri (err u110))
(define-constant err-invalid-value (err u111))
(define-constant err-invalid-duration (err u112))
(define-constant err-invalid-kyc-level (err u113))
(define-constant err-invalid-expiry (err u114))
(define-constant err-invalid-votes (err u115))
(define-constant err-invalid-address (err u116))
(define-constant err-invalid-title (err u117))
