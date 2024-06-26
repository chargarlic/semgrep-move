(* Generated by ocaml-tree-sitter. *)
(*
   move grammar

   entrypoint: source_file
*)

open! Sexplib.Conv
open Tree_sitter_run

type modifier = [
    `Public of Token.t (* "public" *)
  | `Publ_83d19bc of Token.t (* "public(package)" *)
  | `Publ_7c2e49a of Token.t (* "public(friend)" *)
  | `Entry of Token.t (* "entry" *)
  | `Native of Token.t (* "native" *)
]

type pat_2f1c977 = Token.t (* pattern 0x[a-fA-F0-9_]+ *)

type bool_literal = [
    `True of Token.t (* "true" *)
  | `False of Token.t (* "false" *)
]

type unary_op = [ `BANG of Token.t (* "!" *) ]

type spec_apply_name_pattern = Token.t (* pattern [0-9a-zA-Z_*]+ *)

type address_literal = Token.t (* pattern @0x[a-fA-F0-9]+ *)

type byte_string_literal = Token.t (* pattern "b\"(\\\\.|[^\\\\\"])*\"" *)

type spec_condition_kind = [
    `Assert of Token.t (* "assert" *)
  | `Assume of Token.t (* "assume" *)
  | `Decres of Token.t (* "decreases" *)
  | `Ensures of Token.t (* "ensures" *)
  | `Succes_if of Token.t (* "succeeds_if" *)
]

type pat_3937285 =
  Token.t (* pattern [0-9][0-9_]*(?:u8|u16|u32|u64|u128|u256)? *)

type identifier = Token.t (* pattern (`)?[a-zA-Z_][0-9a-zA-Z_]*(`)? *)

type anon_choice_AMP_c6caa5d = [
    `AMP of Token.t (* "&" *)
  | `AMPmut of Token.t (* "&mut" *)
]

type ability = [
    `Copy of Token.t (* "copy" *)
  | `Drop of Token.t (* "drop" *)
  | `Store of Token.t (* "store" *)
  | `Key of Token.t (* "key" *)
]

type hex_string_literal = Token.t (* pattern "x\"[0-9a-fA-F]*\"" *)

type primitive_type = [
    `U8 of Token.t (* "u8" *)
  | `U16 of Token.t (* "u16" *)
  | `U32 of Token.t (* "u32" *)
  | `U64 of Token.t (* "u64" *)
  | `U128 of Token.t (* "u128" *)
  | `U256 of Token.t (* "u256" *)
  | `Bool of Token.t (* "bool" *)
  | `Addr of Token.t (* "address" *)
  | `Signer of Token.t (* "signer" *)
  | `Byte of Token.t (* "bytearray" *)
]

type num_literal = [
    `Pat_3937285 of pat_3937285
  | `Pat_2f1c977 of pat_2f1c977
]

type reserved_identifier = [
    `Forall of Token.t (* "forall" *)
  | `Exists of Token.t (* "exists" *)
]

type ability_decls = (
    Token.t (* "has" *)
  * (ability * Token.t (* "," *)) list (* zero or more *)
  * ability option
)

type postfix_ability_decls = (
    Token.t (* "has" *)
  * (ability * Token.t (* "," *)) list (* zero or more *)
  * ability option
  * Token.t (* ";" *)
)

type literal_value = [
    `Addr_lit of address_literal (*tok*)
  | `Bool_lit of bool_literal
  | `Num_lit of num_literal
  | `Hex_str_lit of hex_string_literal (*tok*)
  | `Byte_str_lit of byte_string_literal (*tok*)
]

type use_member = [
    `Id_COLONCOLON_LCURL_use_member_rep_COMMA_use_member_opt_COMMA_RCURL of (
        identifier (*tok*)
      * Token.t (* "::" *)
      * Token.t (* "{" *)
      * use_member
      * (Token.t (* "," *) * use_member) list (* zero or more *)
      * Token.t (* "," *) option
      * Token.t (* "}" *)
    )
  | `Id_COLONCOLON_id_opt_as_id of (
        identifier (*tok*)
      * Token.t (* "::" *)
      * identifier (*tok*)
      * (Token.t (* "as" *) * identifier (*tok*)) option
    )
  | `Id_opt_as_id of (
        identifier (*tok*)
      * (Token.t (* "as" *) * identifier (*tok*)) option
    )
]

type label = (Token.t (* "'" *) * identifier (*tok*))

type type_parameter = (
    Token.t (* "$" *) option
  * Token.t (* "phantom" *) option
  * identifier (*tok*)
  * (
        Token.t (* ":" *)
      * ability
      * (Token.t (* "+" *) * ability) list (* zero or more *)
      * Token.t (* "+" *) option
    )
      option
)

type anon_choice_num_lit_a33e50c = [
    `Num_lit of num_literal
  | `Module_id of identifier (*tok*)
]

type spec_property = (
    identifier (*tok*)
  * (Token.t (* "=" *) * literal_value) option
)

type block_identifier = (label * Token.t (* ":" *))

type type_parameters = (
    Token.t (* "<" *)
  * type_parameter
  * (Token.t (* "," *) * type_parameter) list (* zero or more *)
  * Token.t (* "," *) option
  * Token.t (* ">" *)
)

type module_identity = (
    anon_choice_num_lit_a33e50c * Token.t (* "::" *) * identifier (*tok*)
)

type condition_properties = (
    Token.t (* "[" *)
  * (spec_property * Token.t (* "," *)) list (* zero or more *)
  * spec_property option
  * Token.t (* "]" *)
)

type enum_signature = (
    Token.t (* "enum" *)
  * identifier (*tok*)
  * type_parameters option
  * ability_decls option
)

type struct_signature = (
    Token.t (* "struct" *)
  * identifier (*tok*)
  * type_parameters option
  * ability_decls option
)

type spec_apply_pattern = (
    [ `Public of Token.t (* "public" *) | `Inte of Token.t (* "internal" *) ]
      option
  * spec_apply_name_pattern (*tok*)
  * type_parameters option
)

type module_access = [
    `DOLLAR_id of (Token.t (* "$" *) * identifier (*tok*))
  | `Rese_id of reserved_identifier
  | `Id of identifier (*tok*)
  | `Module_id_COLONCOLON_id of (
        identifier (*tok*) * Token.t (* "::" *) * identifier (*tok*)
    )
  | `Module_iden_COLONCOLON_id of (
        module_identity * Token.t (* "::" *) * identifier (*tok*)
    )
]

type friend_access = [
    `Id of identifier (*tok*)
  | `Module_iden of module_identity
]

type use_module_member = (module_identity * Token.t (* "::" *) * use_member)

type use_module_members = [
    `Choice_num_lit_COLONCOLON_LCURL_use_member_rep_COMMA_use_member_opt_COMMA_RCURL of (
        anon_choice_num_lit_a33e50c
      * Token.t (* "::" *)
      * Token.t (* "{" *)
      * use_member
      * (Token.t (* "," *) * use_member) list (* zero or more *)
      * Token.t (* "," *) option
      * Token.t (* "}" *)
    )
  | `Module_iden_COLONCOLON_LCURL_use_member_rep_COMMA_use_member_opt_COMMA_RCURL of (
        module_identity
      * Token.t (* "::" *)
      * Token.t (* "{" *)
      * use_member
      * (Token.t (* "," *) * use_member) list (* zero or more *)
      * Token.t (* "," *) option
      * Token.t (* "}" *)
    )
]

type use_module = (
    module_identity
  * (Token.t (* "as" *) * identifier (*tok*)) option
)

type spec_block_target = [
    `Id of identifier (*tok*)
  | `Module of Token.t (* "module" *)
  | `Spec_blk_target_schema of (
        Token.t (* "schema" *)
      * identifier (*tok*)
      * type_parameters option
    )
]

type anon_choice_module_access_0e4603e = [
    `Module_access of module_access
  | `Lit_value of literal_value
]

type macro_module_access = (module_access * Token.t (* "!" *))

type use_fun = (
    Token.t (* "fun" *) * module_access * Token.t (* "as" *) * module_access
  * Token.t (* "." *) * identifier (*tok*)
)

type function_type_parameters = (
    Token.t (* "|" *)
  * (type_ * Token.t (* "," *)) list (* zero or more *)
  * type_ option
  * Token.t (* "|" *)
)

and type_ = [
    `Apply_type of (module_access * type_arguments option)
  | `Ref_type of (anon_choice_AMP_c6caa5d * type_)
  | `Tuple_type of (
        Token.t (* "(" *)
      * (type_ * Token.t (* "," *)) list (* zero or more *)
      * type_ option
      * Token.t (* ")" *)
    )
  | `Func_type of (
        function_type_parameters
      * (Token.t (* "->" *) * type_) option
    )
  | `Prim_type of primitive_type
]

and type_arguments = (
    Token.t (* "<" *)
  * type_
  * (Token.t (* "," *) * type_) list (* zero or more *)
  * Token.t (* "," *) option
  * Token.t (* ">" *)
)

type anon_choice_lit_value_bd85d4e = [
    `Lit_value of literal_value
  | `Module_access of module_access
]

type friend_declaration = (
    Token.t (* "friend" *) * friend_access * Token.t (* ";" *)
)

type use_declaration = (
    Token.t (* "public" *) option
  * Token.t (* "use" *)
  * [
        `Use_fun of use_fun
      | `Use_module of use_module
      | `Use_module_member of use_module_member
      | `Use_module_members of use_module_members
    ]
  * Token.t (* ";" *)
)

type function_parameter = (
    Token.t (* "mut" *) option
  * [
        `Var_id of identifier (*tok*)
      | `DOLLAR_var_id of (Token.t (* "$" *) * identifier (*tok*))
    ]
  * Token.t (* ":" *)
  * type_
)

type ret_type = (Token.t (* ":" *) * type_)

type bind = [
    `Opt_mut_var_id of (Token.t (* "mut" *) option * identifier (*tok*))
  | `Bind_unpack of (
        module_access
      * type_arguments option
      * bind_fields option
    )
  | `Var_id_AT_bind of (identifier (*tok*) * Token.t (* "@" *) * bind)
]

and bind_field = (
    Token.t (* "mut" *) option
  * identifier (*tok*)
  * (Token.t (* ":" *) * bind) option
)

and bind_fields = [
    `Bind_posi_fields of (
        Token.t (* "(" *)
      * (bind_field * Token.t (* "," *)) list (* zero or more *)
      * bind_field option
      * Token.t (* ")" *)
    )
  | `Bind_named_fields of (
        Token.t (* "{" *)
      * (bind_field * Token.t (* "," *)) list (* zero or more *)
      * bind_field option
      * Token.t (* "}" *)
    )
]

type field_annotation = (identifier (*tok*) * Token.t (* ":" *) * type_)

type annotation_item = [
    `Id of identifier (*tok*)
  | `Id_EQ_lit_value of (
        identifier (*tok*) * Token.t (* "=" *) * literal_value
    )
  | `Id_LPAR_choice_lit_value_rep_COMMA_choice_lit_value_opt_COMMA_RPAR of (
        identifier (*tok*)
      * Token.t (* "(" *)
      * anon_choice_lit_value_bd85d4e
      * (Token.t (* "," *) * anon_choice_lit_value_bd85d4e)
          list (* zero or more *)
      * Token.t (* "," *) option
      * Token.t (* ")" *)
    )
  | `Id_LPAR_id_EQ_choice_module_access_rep_COMMA_id_EQ_choice_module_access_opt_COMMA_RPAR of (
        identifier (*tok*)
      * Token.t (* "(" *)
      * identifier (*tok*)
      * Token.t (* "=" *)
      * anon_choice_module_access_0e4603e
      * (
            Token.t (* "," *) * identifier (*tok*) * Token.t (* "=" *)
          * anon_choice_module_access_0e4603e
        )
          list (* zero or more *)
      * Token.t (* "," *) option
      * Token.t (* ")" *)
    )
]

type function_parameters = (
    Token.t (* "(" *)
  * (function_parameter * Token.t (* "," *)) list (* zero or more *)
  * function_parameter option
  * Token.t (* ")" *)
)

type bind_list = [
    `Bind of bind
  | `LPAR_rep_bind_COMMA_opt_bind_RPAR of (
        Token.t (* "(" *)
      * (bind * Token.t (* "," *)) list (* zero or more *)
      * bind option
      * Token.t (* ")" *)
    )
]

type lambda_bindings = (
    Token.t (* "|" *)
  * (bind * Token.t (* "," *)) list (* zero or more *)
  * bind option
  * Token.t (* "|" *)
)

type spec_function_signature = (
    identifier (*tok*)
  * type_parameters option
  * function_parameters
  * ret_type
)

type function_signature = (
    modifier option
  * modifier option
  * Token.t (* "fun" *)
  * identifier (*tok*)
  * type_parameters option
  * function_parameters
  * ret_type option
)

type macro_signature = (
    modifier option
  * Token.t (* "fun" *)
  * identifier (*tok*)
  * type_parameters option
  * function_parameters
  * ret_type option
)

type datatype_fields = [
    `Posi_fields of (
        Token.t (* "(" *)
      * (type_ * Token.t (* "," *)) list (* zero or more *)
      * type_ option
      * Token.t (* ")" *)
    )
  | `Named_fields of (
        Token.t (* "{" *)
      * (field_annotation * Token.t (* "," *)) list (* zero or more *)
      * field_annotation option
      * Token.t (* "}" *)
    )
]

type variant = (identifier (*tok*) * datatype_fields option)

type arg_list = (
    Token.t (* "(" *)
  * (expression * Token.t (* "," *)) list (* zero or more *)
  * expression option
  * Token.t (* ")" *)
)

and binary_expression = [
    `Bin_oper_EQEQGT_bin_oper of (
        binary_operand * Token.t (* "==>" *) * binary_operand
    )
  | `Bin_oper_BARBAR_bin_oper of (
        binary_operand * Token.t (* "||" *) * binary_operand
    )
  | `Bin_oper_AMPAMP_bin_oper of (
        binary_operand * Token.t (* "&&" *) * binary_operand
    )
  | `Bin_oper_EQEQ_bin_oper of (
        binary_operand * Token.t (* "==" *) * binary_operand
    )
  | `Bin_oper_BANGEQ_bin_oper of (
        binary_operand * Token.t (* "!=" *) * binary_operand
    )
  | `Bin_oper_LT_bin_oper of (
        binary_operand * Token.t (* "<" *) * binary_operand
    )
  | `Bin_oper_GT_bin_oper of (
        binary_operand * Token.t (* ">" *) * binary_operand
    )
  | `Bin_oper_LTEQ_bin_oper of (
        binary_operand * Token.t (* "<=" *) * binary_operand
    )
  | `Bin_oper_GTEQ_bin_oper of (
        binary_operand * Token.t (* ">=" *) * binary_operand
    )
  | `Bin_oper_DOTDOT_bin_oper of (
        binary_operand * Token.t (* ".." *) * binary_operand
    )
  | `Bin_oper_BAR_bin_oper of (
        binary_operand * Token.t (* "|" *) * binary_operand
    )
  | `Bin_oper_HAT_bin_oper of (
        binary_operand * Token.t (* "^" *) * binary_operand
    )
  | `Bin_oper_AMP_bin_oper of (
        binary_operand * Token.t (* "&" *) * binary_operand
    )
  | `Bin_oper_LTLT_bin_oper of (
        binary_operand * Token.t (* "<<" *) * binary_operand
    )
  | `Bin_oper_GTGT_bin_oper of (
        binary_operand * Token.t (* ">>" *) * binary_operand
    )
  | `Bin_oper_PLUS_bin_oper of (
        binary_operand * Token.t (* "+" *) * binary_operand
    )
  | `Bin_oper_DASH_bin_oper of (
        binary_operand * Token.t (* "-" *) * binary_operand
    )
  | `Bin_oper_STAR_bin_oper of (
        binary_operand * Token.t (* "*" *) * binary_operand
    )
  | `Bin_oper_SLASH_bin_oper of (
        binary_operand * Token.t (* "/" *) * binary_operand
    )
  | `Bin_oper_PERC_bin_oper of (
        binary_operand * Token.t (* "%" *) * binary_operand
    )
]

and binary_operand = [
    `Un_exp of unary_expression
  | `Bin_exp of binary_expression
  | `Cast_exp of cast_expression
]

and block = (
    Token.t (* "{" *)
  * use_declaration list (* zero or more *)
  * block_item list (* zero or more *)
  * expression option
  * Token.t (* "}" *)
)

and block_item = (
    [ `Exp of expression | `Let_stmt of let_statement ]
  * Token.t (* ";" *)
)

and cast_expression = (expression * Token.t (* "as" *) * type_)

and exp_field = (
    identifier (*tok*)
  * (Token.t (* ":" *) * expression) option
)

and expression = [
    `Lambda_exp of (
        lambda_bindings
      * (Token.t (* "->" *) * type_) option
      * expression
    )
  | `If_exp of if_expression
  | `While_exp of (
        Token.t (* "while" *) * Token.t (* "(" *) * expression
      * Token.t (* ")" *) * expression
    )
  | `Loop_exp of (Token.t (* "loop" *) * expression)
  | `Ret_exp of (
        Token.t (* "return" *)
      * label option
      * [ `Exp_term of expression_term | `Exp of expression ] option
    )
  | `Abort_exp of (Token.t (* "abort" *) * expression)
  | `Assign_exp of (unary_expression * Token.t (* "=" *) * expression)
  | `Un_exp of unary_expression
  | `Bin_exp of binary_expression
  | `Cast_exp of cast_expression
  | `Quan_exp of (
        reserved_identifier
      * quantifier_bindings
      * (Token.t (* "where" *) * expression) option
      * Token.t (* ":" *)
      * expression
    )
  | `Iden_exp of (block_identifier * expression)
  | `Match_exp of (
        Token.t (* "match" *) * Token.t (* "(" *) * expression
      * Token.t (* ")" *) * match_body
    )
  | `Vec_exp of (
        [
            `Vect of Token.t (* "vector[" *)
          | `Vect_type_rep_COMMA_type_opt_COMMA_GT_LBRACK of (
                Token.t (* "vector<" *)
              * type_
              * (Token.t (* "," *) * type_) list (* zero or more *)
              * Token.t (* "," *) option
              * Token.t (* ">" *)
              * Token.t (* "[" *)
            )
        ]
      * (expression * Token.t (* "," *)) list (* zero or more *)
      * expression option
      * Token.t (* "]" *)
    )
]

and expression_term = [
    `Brk_exp of (
        Token.t (* "break" *)
      * label option
      * expression_term option
    )
  | `Cont_exp of (Token.t (* "continue" *) * label option)
  | `Name_exp of (module_access * type_arguments option)
  | `Call_exp of (module_access * type_arguments option * arg_list)
  | `Macro_call_exp of (
        macro_module_access
      * type_arguments option
      * arg_list
    )
  | `Pack_exp of (
        module_access
      * type_arguments option
      * field_initialize_list
    )
  | `Lit_value of literal_value
  | `Unit_exp of (Token.t (* "(" *) * Token.t (* ")" *))
  | `Exp_list of (
        Token.t (* "(" *)
      * expression
      * (Token.t (* "," *) * expression) list (* zero or more *)
      * Token.t (* "," *) option
      * Token.t (* ")" *)
    )
  | `Anno_exp of (
        Token.t (* "(" *) * expression * Token.t (* ":" *) * type_
      * Token.t (* ")" *)
    )
  | `Blk of block
  | `Spec_blk of spec_block
  | `If_exp of if_expression
  | `Dot_exp of (expression_term * Token.t (* "." *) * expression_term)
  | `Index_exp of (
        expression_term * Token.t (* "[" *) * expression * Token.t (* "]" *)
    )
]

and field_initialize_list = (
    Token.t (* "{" *)
  * (exp_field * Token.t (* "," *)) list (* zero or more *)
  * exp_field option
  * Token.t (* "}" *)
)

and if_expression = (
    Token.t (* "if" *)
  * Token.t (* "(" *)
  * expression
  * Token.t (* ")" *)
  * expression
  * (Token.t (* "else" *) * expression) option
)

and let_statement = (
    Token.t (* "let" *)
  * bind_list
  * ret_type option
  * (Token.t (* "=" *) * expression) option
)

and match_arm = (
    bind_list
  * (Token.t (* "if" *) * expression) option
  * Token.t (* "=>" *)
  * expression
)

and match_body = (
    Token.t (* "{" *)
  * (match_arm * Token.t (* "," *)) list (* zero or more *)
  * match_arm option
  * Token.t (* "}" *)
)

and quantifier_binding = [
    `Id_COLON_type of (identifier (*tok*) * Token.t (* ":" *) * type_)
  | `Id_in_exp of (identifier (*tok*) * Token.t (* "in" *) * expression)
]

and quantifier_bindings = (
    quantifier_binding
  * (Token.t (* "," *) * quantifier_binding) list (* zero or more *)
  * Token.t (* "," *) option
)

and spec_block = (
    Token.t (* "spec" *)
  * [
        `Opt_spec_blk_target_spec_body of (
            spec_block_target option
          * spec_body
        )
      | `Spec_func of spec_function
    ]
)

and spec_block_memeber = [
    `Spec_inva of (
        Token.t (* "invariant" *)
      * [
            `Update of Token.t (* "update" *)
          | `Pack of Token.t (* "pack" *)
          | `Unpack of Token.t (* "unpack" *)
          | `Module of Token.t (* "module" *)
        ]
          option
      * condition_properties option
      * expression
      * Token.t (* ";" *)
    )
  | `Spec_func of spec_function
  | `Spec_cond of spec_condition
  | `Spec_incl of (Token.t (* "include" *) * expression * Token.t (* ";" *))
  | `Spec_apply of (
        Token.t (* "apply" *)
      * expression
      * Token.t (* "to" *)
      * spec_apply_pattern
      * (Token.t (* "," *) * spec_apply_pattern) list (* zero or more *)
      * Token.t (* "," *) option
      * (
            Token.t (* "except" *)
          * spec_apply_pattern
          * (Token.t (* "," *) * spec_apply_pattern) list (* zero or more *)
          * Token.t (* "," *) option
        )
          option
      * Token.t (* ";" *)
    )
  | `Spec_pragma of (
        Token.t (* "pragma" *)
      * (spec_property * Token.t (* "," *)) list (* zero or more *)
      * spec_property option
      * Token.t (* ";" *)
    )
  | `Spec_var of (
        [
            `Global of Token.t (* "global" *)
          | `Local of Token.t (* "local" *)
        ]
          option
      * identifier (*tok*)
      * type_parameters option
      * Token.t (* ":" *)
      * type_
      * Token.t (* ";" *)
    )
  | `Spec_let of (
        Token.t (* "let" *)
      * Token.t (* "post" *) option
      * identifier (*tok*)
      * Token.t (* "=" *)
      * expression
      * Token.t (* ";" *)
    )
]

and spec_body = (
    Token.t (* "{" *)
  * use_declaration list (* zero or more *)
  * spec_block_memeber list (* zero or more *)
  * Token.t (* "}" *)
)

and spec_condition = [
    `Spec_cond_ of (
        [
            `Spec_cond_kind of spec_condition_kind
          | `Requis_opt_module of (
                Token.t (* "requires" *)
              * Token.t (* "module" *) option
            )
        ]
      * condition_properties option
      * expression
      * Token.t (* ";" *)
    )
  | `Spec_abort_if of (
        Token.t (* "aborts_if" *)
      * condition_properties option
      * expression
      * (Token.t (* "with" *) * expression) option
      * Token.t (* ";" *)
    )
  | `Spec_abort_with_or_modifs of (
        [
            `Aborts_with of Token.t (* "aborts_with" *)
          | `Modifs of Token.t (* "modifies" *)
        ]
      * condition_properties option
      * expression
      * (Token.t (* "," *) * expression) list (* zero or more *)
      * Token.t (* "," *) option
      * Token.t (* ";" *)
    )
]

and spec_function = [
    `Native_spec_func of (
        Token.t (* "native" *) * Token.t (* "fun" *)
      * spec_function_signature * Token.t (* ";" *)
    )
  | `Usual_spec_func of (
        Token.t (* "fun" *) * spec_function_signature * block
    )
  | `Unin_spec_func of (
        Token.t (* "fun" *) * spec_function_signature * Token.t (* ";" *)
    )
]

and unary_expression = [
    `Un_exp_ of (unary_op * expression)
  | `Borrow_exp of (anon_choice_AMP_c6caa5d * expression)
  | `Dere_exp of (Token.t (* "*" *) * expression)
  | `Move_or_copy_exp of (
        [ `Move of Token.t (* "move" *) | `Copy of Token.t (* "copy" *) ]
      * identifier (*tok*)
    )
  | `Exp_term of expression_term
]

type struct_item = [
    `Native_struct_defi of (
        Token.t (* "public" *) option
      * Token.t (* "native" *)
      * struct_signature
      * Token.t (* ";" *)
    )
  | `Struct_defi of (
        Token.t (* "public" *) option
      * struct_signature
      * datatype_fields
      * postfix_ability_decls option
    )
]

type enum_variants = (
    Token.t (* "{" *)
  * (variant * Token.t (* "," *)) list (* zero or more *)
  * variant option
  * Token.t (* "}" *)
)

type constant = (
    Token.t (* "const" *) * identifier (*tok*) * Token.t (* ":" *) * type_
  * Token.t (* "=" *) * expression * Token.t (* ";" *)
)

type function_item = [
    `Native_func_defi of (function_signature * Token.t (* ";" *))
  | `Macro_func_defi of (
        modifier option
      * Token.t (* "macro" *)
      * macro_signature
      * block
    )
  | `Func_defi of (function_signature * block)
]

type enum_item = [
  `Enum_defi of (
      Token.t (* "public" *) option
    * enum_signature
    * enum_variants
    * postfix_ability_decls option
  )
]

type module_body = (
    [ `SEMI of Token.t (* ";" *) | `LCURL of Token.t (* "{" *) ]
  * [
        `Use_decl of use_declaration
      | `Friend_decl of friend_declaration
      | `Cst of constant
      | `Func_item of function_item
      | `Struct_item of struct_item
      | `Enum_item of enum_item
      | `Spec_blk of spec_block
    ]
      list (* zero or more *)
  * Token.t (* "}" *) option
)

type module_definition = (
    Token.t (* "module" *) * module_identity * module_body
)

type source_file = module_definition list (* zero or more *)

type forall (* inlined *) = Token.t (* "forall" *)

type whitespace (* inlined *) = Token.t (* pattern \s *)

type empty_line (* inlined *) = Token.t

type block_comment (* inlined *) = Token.t

type exists (* inlined *) = Token.t (* "exists" *)

type unit_expression (* inlined *) = (Token.t (* "(" *) * Token.t (* ")" *))

type macro_identifier (* inlined *) =
  Token.t (* pattern [a-zA-Z_][0-9a-zA-Z_]*! *)

type line_comment (* inlined *) = Token.t

type struct_identifier (* inlined *) = identifier (*tok*)

type enum_identifier (* inlined *) = identifier (*tok*)

type type_identifier (* inlined *) = identifier (*tok*)

type variant_identifier (* inlined *) = identifier (*tok*)

type variable_identifier (* inlined *) = identifier (*tok*)

type type_parameter_identifier (* inlined *) = identifier (*tok*)

type function_identifier (* inlined *) = identifier (*tok*)

type module_identifier (* inlined *) = identifier (*tok*)

type field_identifier (* inlined *) = identifier (*tok*)

type spec_block_target_struct (* inlined *) = (
    Token.t (* "struct" *) * identifier (*tok*)
)

type move_or_copy_expression (* inlined *) = (
    [ `Move of Token.t (* "move" *) | `Copy of Token.t (* "copy" *) ]
  * identifier (*tok*)
)

type spec_block_target_fun (* inlined *) = (
    Token.t (* "fun" *) * identifier (*tok*)
)

type continue_expression (* inlined *) = (
    Token.t (* "continue" *)
  * label option
)

type spec_pragma (* inlined *) = (
    Token.t (* "pragma" *)
  * (spec_property * Token.t (* "," *)) list (* zero or more *)
  * spec_property option
  * Token.t (* ";" *)
)

type spec_block_target_schema (* inlined *) = (
    Token.t (* "schema" *)
  * identifier (*tok*)
  * type_parameters option
)

type native_struct_definition (* inlined *) = (
    Token.t (* "public" *) option
  * Token.t (* "native" *)
  * struct_signature
  * Token.t (* ";" *)
)

type apply_type (* inlined *) = (module_access * type_arguments option)

type function_type (* inlined *) = (
    function_type_parameters
  * (Token.t (* "->" *) * type_) option
)

type ref_type (* inlined *) = (anon_choice_AMP_c6caa5d * type_)

type tuple_type (* inlined *) = (
    Token.t (* "(" *)
  * (type_ * Token.t (* "," *)) list (* zero or more *)
  * type_ option
  * Token.t (* ")" *)
)

type spec_variable (* inlined *) = (
    [ `Global of Token.t (* "global" *) | `Local of Token.t (* "local" *) ]
      option
  * identifier (*tok*)
  * type_parameters option
  * Token.t (* ":" *)
  * type_
  * Token.t (* ";" *)
)

type name_expression (* inlined *) = (module_access * type_arguments option)

type bind_named_fields (* inlined *) = (
    Token.t (* "{" *)
  * (bind_field * Token.t (* "," *)) list (* zero or more *)
  * bind_field option
  * Token.t (* "}" *)
)

type bind_positional_fields (* inlined *) = (
    Token.t (* "(" *)
  * (bind_field * Token.t (* "," *)) list (* zero or more *)
  * bind_field option
  * Token.t (* ")" *)
)

type bind_unpack (* inlined *) = (
    module_access
  * type_arguments option
  * bind_fields option
)

type positional_fields (* inlined *) = (
    Token.t (* "(" *)
  * (type_ * Token.t (* "," *)) list (* zero or more *)
  * type_ option
  * Token.t (* ")" *)
)

type named_fields (* inlined *) = (
    Token.t (* "{" *)
  * (field_annotation * Token.t (* "," *)) list (* zero or more *)
  * field_annotation option
  * Token.t (* "}" *)
)

type annotation (* inlined *) = (
    Token.t (* "#[" *)
  * annotation_item
  * (Token.t (* "," *) * annotation_item) list (* zero or more *)
  * Token.t (* "," *) option
  * Token.t (* "]" *)
)

type uninterpreted_spec_function (* inlined *) = (
    Token.t (* "fun" *) * spec_function_signature * Token.t (* ";" *)
)

type native_spec_function (* inlined *) = (
    Token.t (* "native" *) * Token.t (* "fun" *) * spec_function_signature
  * Token.t (* ";" *)
)

type native_function_definition (* inlined *) = (
    function_signature * Token.t (* ";" *)
)

type struct_definition (* inlined *) = (
    Token.t (* "public" *) option
  * struct_signature
  * datatype_fields
  * postfix_ability_decls option
)

type abort_expression (* inlined *) = (Token.t (* "abort" *) * expression)

type annotate_expression (* inlined *) = (
    Token.t (* "(" *) * expression * Token.t (* ":" *) * type_
  * Token.t (* ")" *)
)

type assign_expression (* inlined *) = (
    unary_expression * Token.t (* "=" *) * expression
)

type borrow_expression (* inlined *) = (anon_choice_AMP_c6caa5d * expression)

type break_expression (* inlined *) = (
    Token.t (* "break" *)
  * label option
  * expression_term option
)

type call_expression (* inlined *) = (
    module_access
  * type_arguments option
  * arg_list
)

type dereference_expression (* inlined *) = (Token.t (* "*" *) * expression)

type dot_expression (* inlined *) = (
    expression_term * Token.t (* "." *) * expression_term
)

type expression_list (* inlined *) = (
    Token.t (* "(" *)
  * expression
  * (Token.t (* "," *) * expression) list (* zero or more *)
  * Token.t (* "," *) option
  * Token.t (* ")" *)
)

type identified_expression (* inlined *) = (block_identifier * expression)

type index_expression (* inlined *) = (
    expression_term * Token.t (* "[" *) * expression * Token.t (* "]" *)
)

type lambda_expression (* inlined *) = (
    lambda_bindings
  * (Token.t (* "->" *) * type_) option
  * expression
)

type loop_expression (* inlined *) = (Token.t (* "loop" *) * expression)

type macro_call_expression (* inlined *) = (
    macro_module_access
  * type_arguments option
  * arg_list
)

type match_expression (* inlined *) = (
    Token.t (* "match" *) * Token.t (* "(" *) * expression
  * Token.t (* ")" *) * match_body
)

type pack_expression (* inlined *) = (
    module_access
  * type_arguments option
  * field_initialize_list
)

type quantifier_expression (* inlined *) = (
    reserved_identifier
  * quantifier_bindings
  * (Token.t (* "where" *) * expression) option
  * Token.t (* ":" *)
  * expression
)

type return_expression (* inlined *) = (
    Token.t (* "return" *)
  * label option
  * [ `Exp_term of expression_term | `Exp of expression ] option
)

type spec_abort_if (* inlined *) = (
    Token.t (* "aborts_if" *)
  * condition_properties option
  * expression
  * (Token.t (* "with" *) * expression) option
  * Token.t (* ";" *)
)

type spec_abort_with_or_modifies (* inlined *) = (
    [
        `Aborts_with of Token.t (* "aborts_with" *)
      | `Modifs of Token.t (* "modifies" *)
    ]
  * condition_properties option
  * expression
  * (Token.t (* "," *) * expression) list (* zero or more *)
  * Token.t (* "," *) option
  * Token.t (* ";" *)
)

type spec_apply (* inlined *) = (
    Token.t (* "apply" *)
  * expression
  * Token.t (* "to" *)
  * spec_apply_pattern
  * (Token.t (* "," *) * spec_apply_pattern) list (* zero or more *)
  * Token.t (* "," *) option
  * (
        Token.t (* "except" *)
      * spec_apply_pattern
      * (Token.t (* "," *) * spec_apply_pattern) list (* zero or more *)
      * Token.t (* "," *) option
    )
      option
  * Token.t (* ";" *)
)

type spec_condition_ (* inlined *) = (
    [
        `Spec_cond_kind of spec_condition_kind
      | `Requis_opt_module of (
            Token.t (* "requires" *)
          * Token.t (* "module" *) option
        )
    ]
  * condition_properties option
  * expression
  * Token.t (* ";" *)
)

type spec_include (* inlined *) = (
    Token.t (* "include" *) * expression * Token.t (* ";" *)
)

type spec_invariant (* inlined *) = (
    Token.t (* "invariant" *)
  * [
        `Update of Token.t (* "update" *)
      | `Pack of Token.t (* "pack" *)
      | `Unpack of Token.t (* "unpack" *)
      | `Module of Token.t (* "module" *)
    ]
      option
  * condition_properties option
  * expression
  * Token.t (* ";" *)
)

type spec_let (* inlined *) = (
    Token.t (* "let" *)
  * Token.t (* "post" *) option
  * identifier (*tok*)
  * Token.t (* "=" *)
  * expression
  * Token.t (* ";" *)
)

type unary_expression_ (* inlined *) = (unary_op * expression)

type usual_spec_function (* inlined *) = (
    Token.t (* "fun" *) * spec_function_signature * block
)

type vector_expression (* inlined *) = (
    [
        `Vect of Token.t (* "vector[" *)
      | `Vect_type_rep_COMMA_type_opt_COMMA_GT_LBRACK of (
            Token.t (* "vector<" *)
          * type_
          * (Token.t (* "," *) * type_) list (* zero or more *)
          * Token.t (* "," *) option
          * Token.t (* ">" *)
          * Token.t (* "[" *)
        )
    ]
  * (expression * Token.t (* "," *)) list (* zero or more *)
  * expression option
  * Token.t (* "]" *)
)

type while_expression (* inlined *) = (
    Token.t (* "while" *) * Token.t (* "(" *) * expression
  * Token.t (* ")" *) * expression
)

type macro_function_definition (* inlined *) = (
    modifier option
  * Token.t (* "macro" *)
  * macro_signature
  * block
)

type function_definition (* inlined *) = (function_signature * block)

type enum_definition (* inlined *) = (
    Token.t (* "public" *) option
  * enum_signature
  * enum_variants
  * postfix_ability_decls option
)
