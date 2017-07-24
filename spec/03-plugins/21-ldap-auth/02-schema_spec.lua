local validate_entity = require("kong.dao.schemas_validation").validate_entity
local ldap_auth_schema = require "kong.plugins.ldap-auth.schema"

describe("Plugin: ldap-auth (schema)", function()
  describe("errors", function()
    it("requires ldaps and start_tls to be mutually exclusive", function()
      local ok, errors, err = validate_entity({anonymous="", ldaps = true, start_tls = true}, ldap_auth_schema)
      assert.False(ok)
      assert.equal("LDAPS and STARTTLS cannot be enabled simultaneously. You need to enable only one of the two.", tostring(errors))
    end)
  end)
end)
